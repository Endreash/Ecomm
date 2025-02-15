/*
authRepository acts as a middle layer between the authService and the rest of your app. 
Its responsibilities include:
  Abstracting the data source: The app doesn’t need to know whether the data comes from an API, local storage, or somewhere else.
  Persistence: If you need to store data locally (e.g., tokens, user info), the authRepository handles that.
  Transforming data: It can convert raw API responses into app-friendly models or handle errors in a way that makes sense for the UI.

Key Point: The authRepository is where you decide how data is stored and accessed in your app.
*/

import 'dart:async';
import 'dart:convert';

import 'package:ecomm/src/features/authentication/services/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  final AuthService authService;
  final SharedPreferences prefs;
  final StreamController<bool> _authStateController = StreamController<bool>.broadcast();
  AuthRepository(this.authService, this.prefs);

  Future<String> signupUser(email, password) async {
    try {
      final response = await authService.signupUser(email: email, password: password);
      // Store the token locally
      // await prefs.setString('token', jsonDecode(response)['token']);
      await prefs.setString('token', response); 
      return response;
    } catch (e) {
      // Handle errors
      rethrow;
    }
  }

  Future<String> login(String email, String password) async {
    try {
      final response = await authService.signinUser(email:email, password: password);
      // Store the token locally
      await prefs.setString('token', response);
      return response;
    } catch (e) {
      // Handle errors
      rethrow;
    }
  }

  // Logout
  Future<void> logout() async {
    try {
      await authService.logout();
      // Clear the token locally
      // await prefs.remove('token');
    } catch (e) {
      // Handle errors
      rethrow;
    }
  }

   Stream<bool> checkAuthState() {
    // Emit the current auth state
    // final token = prefs.getString('token');
    // _authStateController.add(token != null);
    return _authStateController.stream;
  }
}

final sharedPreferencesProvider = FutureProvider<SharedPreferences>((ref) async {
  return await SharedPreferences.getInstance();
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final authService = ref.watch(authServiceProvider);
  final prefs = ref.watch(sharedPreferencesProvider).value;
  return AuthRepository(authService, prefs!);
},);