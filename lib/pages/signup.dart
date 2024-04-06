import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

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
  bool _obscureText = true;
  bool _obscureText1 = true;

    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _validateName(String? value) {
    if (value!.isEmpty || !RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
      return "Enter valid name";
    }
    return null;
  }

  // String? _validateEmail(String? value) {
  //   if (value!.isEmpty ||
  //       !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
  //     return "Enter a valid email";
  //   }
  //   return null;
  // }

  String? _validatePhoneNumber(String? value) {
    if (value!.isEmpty ||
        !RegExp(
                r'^\+?([0-9]{1,3})\)?[-.● ]?([0-9]{3})[-.● ]?([0-9]{3})[-.● ]?([0-9]{4})$')
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
                     text: TextSpan(
                       style: TextStyle(
                         fontSize: 36,
                         fontWeight: FontWeight.bold
                       ),
                       children: const [
                         TextSpan(
                           text: 'Learn',
                           style: TextStyle(color: Colors.black),
                         ),
                         TextSpan(
                           text: ' Hub',
                           style: TextStyle(color:const Color.fromARGB(255, 136, 86, 244)),
                         ),
                       ],
                     ),
                    ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
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
                    onPressed: () {
                      // Validate form and submit if valid
                      // if (_formKey.currentState!.validate()) {
                      //   // Form is valid, perform actions
                      // }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      fixedSize: const Size(250, 50),
                      backgroundColor: const Color.fromARGB(255, 136, 86, 244),
                    ),
                    child: Text(
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
