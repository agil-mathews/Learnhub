import 'package:flutter/material.dart';
import 'package:learnhub/providers/course_provider.dart';
import 'package:learnhub/providers/pending_provider.dart';
import 'package:learnhub/providers/user_provider.dart';
import 'splash.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => UserProvider()),
      ChangeNotifierProvider(create: (_) => PendingProvider()),
      ChangeNotifierProvider(create: (_) => CourseProvider()),
    ],
  child: const MyApp()));
  // List<int> integ = [1,2,3,4,5];
  // integ.removeWhere((element) => element == 5);

  // Map<String, dynamic> data ={
  //  "name": "Agil",
  //  "Age": 27,
  //  "employee": "student"
  // };
  // data.containsKey("Age");
  // displaydetails(name: "agil");


}

void displaydetails({ required String name, int? age}){

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      
      // colorScheme: ColorScheme.fromSeed(seedColor: const Color(0x007f53fe)),

        useMaterial3: true,
      ),
      // home: Splash(),
      home: const Splash(),
    );
  }
}




