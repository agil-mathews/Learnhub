import 'package:flutter/material.dart';
// import 'package:learnhub/home.dart';
import 'pages/login.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigatetohome();
  }

  _navigatetohome()async{
    await Future.delayed(const Duration(milliseconds: 3000), () {});
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MyLogin()));
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(width: 100,height: 100,color: Colors.deepPurple,
            child: const Center(child: Text('LH',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),)), ),
            const Text('LearnHUB',style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              
            ),),
          ],
        ),
      ),
    );
  }
}