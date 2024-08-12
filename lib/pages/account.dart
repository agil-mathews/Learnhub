import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:learnhub/instructor/screens/instructor_home.dart';
import 'package:learnhub/providers/user_provider.dart';
import 'package:learnhub/services/auth_services.dart';
import 'package:provider/provider.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {

void signOutUser(BuildContext context){
AuthService().signOut(context);
}


  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserProvider>(context).user;
    
    log(user.token!);
    log(user.name!);
    
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
          child: Row(
            children: [
              Text(
                'Account',
                style: TextStyle(color: Colors.deepPurple[400]),
              ),
              const Spacer(),
              const Icon(Icons.shopping_cart_outlined, size: 35),
            ],
          ),
        ),
      ),
      body:  SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50.0,
            ),
            const Center(
              child: Icon(Icons.account_circle, size: 125),
            ),
            Center(
                child: Text(
              user.name ?? 'No Name',
              style: const TextStyle(fontSize: 20),
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.mail_outline, size: 35),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  user.email ?? 'No email',
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  width: 30,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: (){
    Navigator.push( 
          context,
          MaterialPageRoute(builder: (context) =>  const Instructor_home()),
      );              },
              child: const Center(
                  child: Text(
                'Switch to Instructor View',
                style: TextStyle(fontSize: 20, color: Colors.deepPurple),
              )),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Video Preferences',
                    style: TextStyle(fontSize: 15),
                  ),
                  const Text(
                    'Download Options',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Account Settings'),
                  const Text(
                    'Account Security',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  const Text(
                    'Email notification preferences',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Help and support'),
                  const Text(
                    'About LearnHub',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  const Text(
                    'FAQ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  const Text(
                    'Share the app',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Center(
                      child: GestureDetector(
                        onTap: () =>signOutUser(context),
                        child: const Text(
                                            'Sign out',
                                            style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                                          ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
