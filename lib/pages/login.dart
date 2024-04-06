// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:learnhub/pages/signup.dart';
import 'package:learnhub/home.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  // final _usernameContoller = TextEditingController();
  // final _passwordController = TextEditingController();

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  get _usernameContoller => null;

  get _passwordController => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 60.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
  text: TextSpan(
    style: TextStyle(
      fontSize: 24.0,
      fontFamily: 'Roboto', // You can customize the font family as needed
    ),
    children: const [
      TextSpan(
        text: 'Learn',
        style: TextStyle(color: Colors.black),
      ),
      TextSpan(
        text: ' Hub',
        style: TextStyle(color: Colors.purple),
      ),
    ],
  ),
 ),
                // Text(
                //   'Learn HUB',
                //   style: GoogleFonts.poppins(
                //       fontSize: 25,
                //       fontWeight: FontWeight.bold,
                //       color: Colors.deepPurple),
                // ),
                
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Image.asset('assets/undraw_fatherhood_7i19.png'),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _usernameContoller,
                        decoration: InputDecoration(
                          // border: OutlineInputBorder(),
                          hintText: 'Username',
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            // border: OutlineInputBorder(),
                            hintText: 'Password'),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          Text(
                            'Forgot Password?',
                           
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      ElevatedButton(
                          onPressed: () {
                             Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyHome()),
                          );
                          },
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor:
                                  Color.fromARGB(255, 136, 86, 244)),
                          child: Text(
                            'Login',
                            style: TextStyle(fontSize: 20,
                                fontWeight: FontWeight.bold,)
                              
                          )),
                      SizedBox(
                        height: 10.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MySignup()),
                          );
                        },
                        child: Text(
                          'New User? Sign Up',
                          
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
