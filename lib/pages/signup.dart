import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:learnhub/services/auth_services.dart';

class MySignup extends StatefulWidget {
  const MySignup({Key? key}) : super(key: key);

  @override
  State<MySignup> createState() => _MySignupState();
}

class _MySignupState extends State<MySignup> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phonenumberController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  final AuthService authService = AuthService();
  bool _obscureText = true;
  bool _obscureText1 = true;
  

    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _validateName(String? value) {
    if (value!.isEmpty || !RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
      return "Enter valid name";
    }
    return null;
  }


  String? _validatePhoneNumber(String? value) {
    if (value!.isEmpty ||
        !RegExp(
                r'^(\d{10})$')
            .hasMatch(value)) {
      return "Enter a valid phone number";
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value!.isEmpty ||
        !RegExp(
                r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$')
            .hasMatch(value)) {
      return "Weak Password";
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value != _passwordController.text) {
      return "Password does not match";
    }
    return null;
  }

  void signUpUser(){
    
    authService.signUpUser(
      context: context, 
      name: _nameController.text, 
      email: _emailController.text, 
      phone: _phonenumberController.text, 
      password: _passwordController.text);
  }

@override
//   void dispose(){
//   super.dispose();
//   _nameController.dispose();
//   _emailController.dispose();
//   _phonenumberController.dispose();
//   _passwordController.dispose();
//   _confirmpasswordController.dispose();

// }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(48.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                   RichText(
                     text: const TextSpan(
                       style: TextStyle(
                         fontSize: 36,
                         fontWeight: FontWeight.bold
                       ),
                       children: [
                         TextSpan(
                           text: 'Learn',
                           style: TextStyle(color: Colors.black),
                         ),
                         TextSpan(
                           text: ' Hub',
                           style: TextStyle(color:Color.fromARGB(255, 136, 86, 244)),
                         ),
                       ],
                     ),
                    ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    'Here to get Welcomed',
                   
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: "Name",
                      hintText: 'Enter your Name',
                      hintStyle: TextStyle(color: Colors.grey.withOpacity(1)),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                    ),
                    validator: _validateName,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.grey.withOpacity(1)),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                    ),
                    validator: MultiValidator(
                      [
                        EmailValidator(errorText: 'Enter valid email address')
                      ]
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _phonenumberController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      hintText: 'Phone Number',
                      hintStyle: TextStyle(color: Colors.grey.withOpacity(1)),
                    ),
                    validator: _validatePhoneNumber,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _passwordController,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.grey.withOpacity(1)),
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
                    validator: _validatePassword,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _confirmpasswordController,
                    obscureText: _obscureText1,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      hintText: 'Confirm Password',
                      hintStyle: TextStyle(color: Colors.grey.withOpacity(1)),
                      suffixIcon: IconButton(
                        icon: Icon(_obscureText1
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _obscureText1 = !_obscureText1;
                          });
                        },
                      ),
                    ),
                    validator: _validateConfirmPassword,
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  ElevatedButton(
                    onPressed: signUpUser,
                     
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      fixedSize: const Size(250, 50),
                      backgroundColor: const Color.fromARGB(255, 136, 86, 244),
                    ),
                    child: const Text(
                      'Create Account',
                     
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  const Text('Already have an account? Login In')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
