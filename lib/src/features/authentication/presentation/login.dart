// // import 'package:ecomm/src/screens/signup.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;


// class LoginPage extends StatelessWidget {
//   LoginPage ({Key?key}):super(key: key);

//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   void login() async {
//     final response = await http.post(
//       Uri.parse('http://localhost:3000/auth/login'),
//       body: {
//         'email': emailController.text,
//         'password': passwordController.text,
//       },
//     );
//     if (response.statusCode == 200) {
//       // Handle successful login
//     } else {
//       // Handle login error
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Login'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: emailController,
//               decoration: const InputDecoration(
//                 labelText: 'Email',
//               ),
//             ),
//             TextField(
//               controller: passwordController,
//               obscureText: true,
//               decoration: const InputDecoration(
//                 labelText: 'Password',
//               ),
//             ),
//             const SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: login,
//               child: const Text('Login'),
//             ),
//               Stack(
//                       children: [
//                         SizedBox(
//                           height: 50.0,
//                           child: Center(
//                             child: Wrap(
//                               children: [
//                                 Text(
//                                   'Don;t have an account?',
//                                   style: TextStyle(
//                                     color: Colors.grey[600],
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 // Material(
//                                 //   child: InkWell(
//                                 //     onTap: () {
//                                 //       Navigator.push(
//                                 //         context,
//                                 //         MaterialPageRoute(
//                                 //           builder: (context) =>
//                                 //               const Signup(),
//                                 //         ),
//                                 //       );
//                                 //     },
//                                 //     child: const Text(
//                                 //       "Sign up",
//                                 //       style: TextStyle(
//                                 //           color: Color(0xffc2185b),
//                                 //           fontWeight: FontWeight.bold,
//                                 //           fontSize: 15),
//                                 //     ),
//                                 //   ),
//                                 // )
//                               ],
//                             ),
//                           ),
//                         )
//                       ],
//         )], 
//         ),
//       ),
//     );
//   }
// }

import 'package:ecomm/src/features/authentication/data/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  // final AuthService authService = AuthService();

  // void loginUser() {
  //   authService.signinUser(
  //     email: emailController.text,
  //     password: passwordController.text,
  //   );
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authRepo = ref.watch(authRepositoryProvider);
    
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Login",
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.08),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Enter your email'
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: 'Enter your password'
              ),
            ),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () async {
              try {
                final token = await authRepo.login(emailController.text, passwordController.text);
                print('Login successful, token: $token');
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Login successful!')));
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Login failed: $e')),
              );
              print(e);
              }
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
              textStyle: MaterialStateProperty.all(
                const TextStyle(color: Colors.white),
              ),
              minimumSize: MaterialStateProperty.all(
                Size(MediaQuery.of(context).size.width / 2.5, 50),
              ),
            ),
            child: const Text(
              "Login",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}