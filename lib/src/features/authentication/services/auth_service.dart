// import 'dart:convert' as convert;

import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

// Your authService will handle the actual API calls to your Node.js backend. 
// It should:
  // Make HTTP requests: For example, POST requests to /signup and /login.
  // Handle tokens: Store and manage authentication tokens (e.g., JWT) securely.
  
class AuthService {
  Future<String> signupUser({
    required String email,
    // required String name,
    required String password
  }) async {
    try {
      // User user = User(id: '', email: email, token: '', password: password);
      
      final url = Uri.parse('http://192.168.100.4:3000/auth/register');
      // var url = Uri.https('http://192.168.100.4:3000/auth/register');
      // Await the http get response, then decode the json-formatted response.
      var response = await http.post(
        url, 
        // body: user.toJson(),
        body:jsonEncode({
          'email': email,
          'password': password
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        }
        );
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return responseData['token']; // Return the token
      } else {
        throw Exception('Failed to sign up: ${response.body}');
      }

    } catch (e) {
      throw Exception('Signup failed: $e');
      // print(e);
    }
  }

  Future<String> signinUser({
    required String email,
    required String password
  }) async {
    try {
      final url = Uri.parse('http://192.168.100.4:3000/auth/login');

      var response = await http.post(
        url,
        body: jsonEncode({
          'email': email,
          'password': password
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        }
      );
       if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return responseData['token']; // Return the token
      } else {
        throw Exception('Failed to log in: ${response.body}');
      }
    } catch (e) {
       throw Exception('Login failed: $e');
      // print(e);
    }
  }

  Future<void> logout() async {
    // Make a POST request to /logout
    // Clear the token on the server side
  }
}

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService();
},);