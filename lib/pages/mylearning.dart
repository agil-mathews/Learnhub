import 'package:flutter/material.dart';



class Mylearning extends StatefulWidget {
  const Mylearning({super.key});

  @override
  State<Mylearning> createState() => _MylearningState();
}

class _MylearningState extends State<Mylearning> {
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
                'My courses',
                style: TextStyle(color: Colors.deepPurple[400]),
              ),
              const Spacer(),
              const Icon(Icons.shopping_cart_outlined, size: 35),
            ],
          ),
        ),
      ),

      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text('What will you learn first?',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
          SizedBox(height: 10,),
          Text('Your Courses will go here',style: TextStyle(fontSize: 19),),
        ],
      ),
    );
  }
}