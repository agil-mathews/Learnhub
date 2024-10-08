import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:learnhub/common/widgets/video_player.dart';
import 'package:learnhub/models/course.dart';

class MyContent extends StatefulWidget {
  const MyContent({
    super.key,
    required this.course,
  });
  final Course course;

  @override
  State<MyContent> createState() => _MyContentState();
}

class _MyContentState extends State<MyContent> {
  Course get course => widget.course;

  

  

  @override
  Widget build(BuildContext context) {
    log('widget.course ${widget.course}');
    // print('widget.course ${widget.course}');
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Course'),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 100.0),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SamplePlayer(previewUrl: widget.course.videoPath),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      widget.course.name ?? 'No Author',
                      style: const TextStyle(
                          fontSize: 25, fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      ' ${widget.course.description ?? 'No Description'}',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                        'Created by  ${widget.course.userName ?? 'No Author'}'),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      children: [
                        Icon(Icons.sports_basketball_outlined),
                        SizedBox(
                          width: 10,
                        ),
                        Text('English'),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('₹${widget.course.price}',style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.deepPurple),
                        minimumSize:
                            MaterialStateProperty.all(const Size(400, 50)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0))),
                      ),
                      onPressed: () {
                        // Add logic to handle checkout button press
                      },
                      child: const Text(
                        'Buy Now ',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(onPressed: (){},
                    
                    style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(Colors.grey),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),
                      minimumSize: MaterialStateProperty.all(const Size(165, 50)),
                    ), 
                    child: const Text('Add to Cart',style: TextStyle(color: Colors.black),),
                    ),
                    // const SizedBox(width: 5,),
                    OutlinedButton(onPressed: (){},
                    style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(Colors.grey),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),
                       minimumSize: MaterialStateProperty.all(const Size(165, 50)),
                    ), 
                    child: const Text('Add to Wishlist',style: TextStyle(color: Colors.black),),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                    const Text(
                      'Requirements',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.course.requirements ?? 'No Requirements',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Description ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.course.brief ?? 'No Description',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Category: ${widget.course.category ?? 'No category'}',
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Fixed buttons
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              color: Colors.white,
              child: Row(
                children: [
                  const Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Accept',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const Spacer(),
                  // SizedBox(width: 50,),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        onPressed: () => (),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red)),
                        child: const Text(
                          'Buy Now',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
