import 'package:flutter/material.dart';
import 'package:learnhub/admin/screens/admin_pendings.dart';
import 'package:learnhub/instructor/service/instructor_service.dart';

import '../../services/auth_services.dart';

// ignore: camel_case_types
class Admin_home extends StatelessWidget {
  const Admin_home({super.key});

void signOutUser(BuildContext context){
AuthService().signOut(context);
}
void getallpending(BuildContext context) {
  InstructorService().getAllPendings(context);
  Navigator.push(context, MaterialPageRoute(builder: (context) => const AllPendings(),));
}



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Admin'),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: ()=>getallpending(context), child: const Text('Course Requests')),
          Center(
             child: ElevatedButton(onPressed: () =>signOutUser(context),
             child: const Text('Signout'),),
             
          ),
          
        ],
      ),
      
    );
  }
}