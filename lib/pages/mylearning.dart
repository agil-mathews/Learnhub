import 'package:flutter/material.dart';
import 'package:learnhub/common/widgets/video_player.dart';



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

      body:   Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SamplePlayer(previewUrl: 'https://mazwai.com/videvo_files/video/free/2016-04/small_watermarked/the_valley-graham_uheslki_preview.webm',),
          const SizedBox(height: 10,),
          const Text('Your Courses will go here',style: TextStyle(fontSize: 19),),
          RichText(
  text: const TextSpan(
    children: [
      TextSpan(
        text: 'Requirements:\n',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0,color: Colors.black),
      ),
      TextSpan(
        text: ' Item 1\n',
        style: TextStyle(fontSize: 16.0,color: Colors.black),
        children: [
          WidgetSpan(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0), // Adjust indentation
              child: Text(
                '*', // Replace with actual bullet symbol if desired
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.red, // Optional: customize bullet color
                ),
              ),
            ),
          ),
        ],
      ),
      TextSpan(
        text: 'Item 2\n',
        style: TextStyle(fontSize: 16.0,color: Colors.black),
        children: [
          WidgetSpan(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                '*', // Replace with actual bullet symbol if desired
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.red, // Optional: customize bullet color
                ),
              ),
            ),
          ),
        ],
      ),
      // ... Add more bullet points as needed
    ],
  ),
),
        ],
      ),
    );
  }
}