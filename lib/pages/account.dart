import 'package:flutter/material.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
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
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50.0,
          ),
          Center(
            child: Icon(Icons.account_circle, size: 125),
          ),
          Center(
              child: Text(
            'User Name',
            style: TextStyle(fontSize: 20),
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.mail_outline, size: 35),
              SizedBox(
                width: 10,
              ),
              Text(
                'User Email',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                width: 30,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Center(
              child: Text(
            'Switch to Instructor View',
            style: TextStyle(fontSize: 20, color: Colors.deepPurple),
          )),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Video Preferences',
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  'Download Options',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 20,
                ),
                Text('Account Settings'),
                Text(
                  'Account Security',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Email notification preferences',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 20,
                ),
                Text('Help and support'),
                Text(
                  'About LearnHub',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                Text(
                  'FAQ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Share the app',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 100,
                ),
                Center(
                    child: Text(
                  'Sign out',
                  style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
