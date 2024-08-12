// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:learnhub/pages/signup.dart';
import 'package:learnhub/services/auth_services.dart';
import 'package:provider/provider.dart';
import '../admin/screens/admin_home.dart';
import '../home.dart';
import '../providers/user_provider.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> with SingleTickerProviderStateMixin {
  final _usernameContoller = TextEditingController();
  final _passwordController = TextEditingController();
  final AuthService authService = AuthService();
  bool _obscureText = true;
  final int _maxlength = 20;

  final GlobalKey<FormState> _loginformkey = GlobalKey<FormState>();

  void loginUser() {
    authService.signInUser(
      context: context,
      email: _usernameContoller.text,
      password: _passwordController.text,
    );

    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        final userProvider = Provider.of<UserProvider>(context);
        if (userProvider.user.token!.isEmpty) {
          return MyLogin(); // If token is empty, redirect to login
        } else if (userProvider.user.type != 'admin') {
          return MyHome(); // If user type is not admin, redirect to home
        } else {
          return Admin_home(); // If token is not empty and user type is admin, redirect to admin home
        }
      },
    ));
  }

// @override
//   void dispose(){
//   super.dispose();
//   _usernameContoller.dispose();
//   _passwordController.dispose();

// }
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
                        fontSize: 36,
                        // fontFamily: 'Roboto',
                        fontWeight: FontWeight
                            .bold // You can customize the font family as needed
                        ),
                    children: const [
                      TextSpan(
                        text: 'Learn',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: ' Hub',
                        style:
                            TextStyle(color: Color.fromARGB(255, 136, 86, 244)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Image.asset('assets/undraw_fatherhood_7i19.png'),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _loginformkey,
                    child: Column(
                      children: [
                       
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _usernameContoller,
                          decoration: InputDecoration(
                            labelText: "Username",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Enter your Username',
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: _obscureText,
                          maxLength: _maxlength,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            labelText: "Password",
                            hintText: 'Enter your Password',
                            suffixIcon: IconButton(
                              icon: Icon(_obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: const [
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
                              loginUser();
                            },
                            style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor:
                                    Color.fromARGB(255, 136, 86, 244)),
                            child: Text('Login',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ))),
                        SizedBox(
                          height: 10.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MySignup()),
                            );
                          },
                          child: Text(
                            'New User? Sign Up',
                          ),
                        ),
                      ],
                    ),
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
