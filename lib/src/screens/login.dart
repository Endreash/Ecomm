// import 'package:ecomm/src/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class LoginPage extends StatelessWidget {
  LoginPage ({Key?key}):super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  void login() async {
    final response = await http.post(
      Uri.parse('http://localhost:4000/auth/login'),
      body: {
        'email': emailController.text,
        'password': passwordController.text,
      },
    );
    if (response.statusCode == 200) {
      // Handle successful login
    } else {
      // Handle login error
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: login,
              child: const Text('Login'),
            ),
              Stack(
                      children: [
                        SizedBox(
                          height: 50.0,
                          child: Center(
                            child: Wrap(
                              children: [
                                Text(
                                  'Don;t have an account?',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                // Material(
                                //   child: InkWell(
                                //     onTap: () {
                                //       Navigator.push(
                                //         context,
                                //         MaterialPageRoute(
                                //           builder: (context) =>
                                //               const Signup(),
                                //         ),
                                //       );
                                //     },
                                //     child: const Text(
                                //       "Sign up",
                                //       style: TextStyle(
                                //           color: Color(0xffc2185b),
                                //           fontWeight: FontWeight.bold,
                                //           fontSize: 15),
                                //     ),
                                //   ),
                                // )
                              ],
                            ),
                          ),
                        )
                      ],
        )], 
        ),
      ),
    );
  }
}


// import 'package:ecomm/home_page.dart';
// import 'package:flutter/material.dart';

// class Login extends StatefulWidget{
//   const Login({Key?key}):super(key: key);
//   @override
//   State<StatefulWidget>createState(){
//     return LoginState();
//   }
// }

// class LoginState extends State<Login>{
//   TextEditingController username=TextEditingController();
//   TextEditingController password=TextEditingController();
//   @override 
//   Widget build(BuildContext context){
//     return Scaffold(
//       appBar: AppBar(
//         title:const Text("Login"),
//         backgroundColor: Colors.teal,
//        leading: null,
//        // centerTitle: true,
//          ),
//          backgroundColor: Colors.white54,
//          body: Center(
//            child: Container(
//             margin: const EdgeInsets.all(20),
//             width: 400,
//             height: 400,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: Colors.white
//               ),
//               child: Center(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
                     
//                       TextField(
//                         controller: username,
//                         decoration: const InputDecoration(
//                           label: Center(child: Text("User Name"))
//                         ),

//                       ),
//                       const SizedBox(
//                         height: 15,
//                       ),
//                        TextField(
//                         controller: password,
//                        obscureText: true,
//                         decoration: const InputDecoration(
//                           label: Center(child:Text("Password")), 
//                         ),      
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       SizedBox(
//                         width: double.infinity,
//                         child: ElevatedButton(onPressed: (){
//                           // if(username.text=="admin" && password.text=="admin"){
//                           if(username.text=="" && password.text==""){
//                             username.text="";
//                             password.text="";
//                             Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const HomePage()));
//                           }
//                           else{

//                           } 
//                         },
//                         style: ElevatedButton.styleFrom(                             
//                           backgroundColor: Colors.blue, // Background color of the button
//                           foregroundColor: Colors.white, // Text color of the button
//                           textStyle: const TextStyle(fontSize: 16), // Text style of the button
//                           padding: const EdgeInsets.all(12), // Padding around the button's child widget
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(5), // Border radius of the button
//                           ),
//                           elevation: 4, // Elevation of the button
//                         ),
                        
                         
//                         child: const Text("Login")),
//                       )
//                     ]
//                     ),
//                 ),
//               ),
         
//            ),
//          ),
//     );
//   }
// }