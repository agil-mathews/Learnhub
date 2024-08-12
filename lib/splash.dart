import 'package:flutter/material.dart';
import 'package:learnhub/home.dart';
import 'package:learnhub/providers/user_provider.dart';
import 'package:learnhub/services/auth_services.dart';
import 'package:provider/provider.dart';
// import 'package:learnhub/home.dart';
import 'admin/screens/admin_home.dart';
import 'pages/login.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
final AuthService authService = AuthService();

@override
  void initState() {
    super.initState();
    _navigatetohome();

  }

  _navigatetohome()async{
    await Future.delayed(const Duration(milliseconds: 3000), () {});
    // ignore: use_build_context_synchronously
        
    // ignore: use_build_context_synchronously
    authService.getUserData(context);

    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)
    {
      final userProvider = Provider.of<UserProvider>(context);
      if (userProvider.user.token!.isEmpty) {
        return const MyLogin(); // If token is empty, redirect to login
      } else if (userProvider.user.type != 'admin') {
        return const MyHome(); // If user type is not admin, redirect to home
      } else {
        return const Admin_home(); // If token is not empty and user type is admin, redirect to admin home
      }
    },
    // Provider.of<UserProvider>(context).user.token!.isEmpty? MyLogin(): MyHome()
    ));
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      body: Center(child: Image.asset('assets/Screenshot_2024-06-05_104626-transformed-removebg-preview.png')),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Container(width: 100,height: 100,color: Colors.deepPurple,
      //       child: const Center(child: Text('LH',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),)), ),
      //       const Text('LearnHUB',style: TextStyle(
      //         fontSize: 24,
      //         fontWeight: FontWeight.bold,
              
      //       ),),
      //     ],
      //   ),
      // ),
    );
  }
}