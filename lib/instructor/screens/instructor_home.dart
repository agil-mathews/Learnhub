import 'package:flutter/material.dart';
import 'package:learnhub/instructor/screens/add_course.dart';

// import '../../services/auth_services.dart';

// ignore: camel_case_types
class Instructor_home extends StatelessWidget {
  const Instructor_home({super.key});



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Instructor'),
      ),
      body: Row(
        children: [
          Center(
             child: ElevatedButton(onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) => const AddCourse() ));
             },
             child: const Text('Create Course'),),
             
          ),
          ElevatedButton(onPressed: (){}, child: const Text('My Cousrses'))
        ],
      ),
      
      
    );
  }
}