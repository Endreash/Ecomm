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