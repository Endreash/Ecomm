// import 'package:ecomm/src/screens/login.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class Signup extends StatefulWidget {
//   const Signup({super.key});

//   @override
//   State<Signup> createState() => _SignupState();
// }

// class _SignupState extends State<Signup> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Column(
//             children:[
//                 Container(
//               height: 300,
//               decoration: const BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   bottomRight: Radius.circular(90),
//                 ),
//                 color: Color(0xffc2185b),
//                 gradient: LinearGradient(
//                   colors: [
//                     (Color(0xffc2185b)),
//                     (Color(0xffc2185b)),
//                   ],
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                 ),
//               ),
//               child: Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Container(
//                       margin: const EdgeInsets.only(top: 50),
//                       child: Image.asset(
//                         "",
//                         height: 190,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     Container(
//                       margin: const EdgeInsets.only(
//                         right: 20,
//                         top: 20,
//                       ),
//                       alignment: Alignment.bottomLeft,
//                       child: const Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: Text(
//                           "Sign up",
//                           style: TextStyle(
//                             fontSize: 20,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             Container(
//               margin: const EdgeInsets.only(left: 10, right: 10, top: 40),
//               padding: const EdgeInsets.only(left: 10, right: 10),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 color: Colors.grey[200],
//               ),
//               alignment: Alignment.center,
//               child: Form(
//                 key: _formKey,
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     children: [
//                       TextFormField(
//                         onSaved: (value) => firstname = value!,
//                         autofocus: false,
//                         textInputAction: TextInputAction.next,
//                         decoration: buildInputDecoration(
//                             "Enter your first name",
//                             Icons.supervised_user_circle,
//                             "First name"),
//                       ),
//                       const SizedBox(
//                         height: 12,
//                       ),
//                       TextFormField(
//                         onSaved: (value) => lastname = value!,
//                         autofocus: false,
//                         textInputAction: TextInputAction.next,
//                         decoration: buildInputDecoration("Enter last name",
//                             Icons.supervised_user_circle, "Enter last name"),
//                         validator: (String? lname) {},
//                       ),
//                       const SizedBox(
//                         height: 12,
//                       ),
//                       TextFormField(
//                         onSaved: (value) => mobile = value!,
//                         textInputAction: TextInputAction.next,
//                         keyboardType: TextInputType.phone,
//                         decoration: buildInputDecoration(
//                           "Enter phone number",
//                           Icons.phone_android,
//                           "Enter phone",
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 12,
//                       ),
//                       TextFormField(
//                         onSaved: (value) => email = value!,
//                         autofocus: true,
//                         textInputAction: TextInputAction.next,
//                         keyboardType: TextInputType.emailAddress,
//                         decoration: buildInputDecoration("Enter your email",
//                             Icons.email_outlined, "Enter email"),
//                       ),
//                       const SizedBox(
//                         height: 12,
//                       ),
//                       PinCodeTextField(
//                         onSaved: (value) => pin = value!,
//                         obscureText: true,
//                         appContext: context,
//                         length: 4,
//                         onChanged: (String value) {},
//                       ),
//                       const SizedBox(
//                         height: 12,
//                       ),
//                       SizedBox(
//                           height: 55.0,
//                           child: ElevatedButton(
//                             onPressed: () async {

//                             },
//                             style: ElevatedButton.styleFrom(
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 30,
//                               ),
//                               // primary: Color(0xffc2185b),
//                               shape: const RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.all(
//                                   Radius.circular(30),
//                                 ),
//                               ),

//                             ),
//                             child: Container(
//                               alignment: Alignment.center,
//                               child: const Text(
//                                 "Sign up",
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 25,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       Stack(
//                         children: [
//                           Center(
//                             child: Wrap(
//                               children: [
//                                 const Text(
//                                   'Already have an account??',
//                                   style: TextStyle(
//                                     color: Color(0xffc2185b),
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 Material(
//                                   child: InkWell(
//                                     onTap: () {
//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                           builder: (context) =>
//                                              LoginPage(),
//                                         ),
//                                       );
//                                     },
//                                     child: const Text(
//                                       "Login",
//                                       style: TextStyle(
//                                           color: Color(0xffc2185b),
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 15),
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             )
//           ]
//         )
//         ); 
//   }
// }



import 'package:ecomm/src/features/authentication/data/auth_repository.dart';
import 'package:ecomm/src/routing/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignupScreen extends ConsumerWidget {
  SignupScreen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authRepo = ref.watch(authRepositoryProvider);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Signup",
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.08),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Enter your name'
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText:'Enter your email')
            ),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: 'Enter your password'
                )
            ),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () async {
              try {
                final token = await authRepo.signupUser(emailController.text, passwordController.text);
                print('Login successful, token: $token');
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Sign up successful!')));
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Sign up failed: $e')),
              );
              }
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green),
              textStyle: MaterialStateProperty.all(
                const TextStyle(color: Colors.white),
              ),
              minimumSize: MaterialStateProperty.all(
                Size(MediaQuery.of(context).size.width / 2.5, 50),
              ),
            ),
            child: const Text(
              "Sign up",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          TextButton(
            onPressed: () => context.goNamed(AppRoute.login.name),
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const LoginScreen(),
              //   ),
              // );
            child: const Text('Login User?'),
          ),
        ],
      ),
    );
  }
}