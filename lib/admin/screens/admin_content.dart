import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:learnhub/admin/service/admin_service.dart';
import 'package:learnhub/common/widgets/video_player.dart';
import 'package:learnhub/models/product.dart';
import 'admin_home.dart';

class AdminContent extends StatefulWidget {
  const AdminContent({
    super.key,
    required this.course,
  });
  final Product course;

  @override
  State<AdminContent> createState() => _AdminContentState();
}

class _AdminContentState extends State<AdminContent> {
  Product get course => widget.course;

  void deletePendings(BuildContext context) {
    AdminService().deletePendings(widget.course.name);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Admin_home(),
        ));
  }

  void acceptCourse(BuildContext context) async {
    AdminService().addCourse(widget.course);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Admin_home(),
      ),
    );
  }

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
                      child: Text(
                        'Rs ${widget.course.price} ',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
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
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        onPressed: () => acceptCourse(context),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green)),
                        child: const Text(
                          'Accept',
                          style: TextStyle(color: Colors.white),
                        ),
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
                        onPressed: () => deletePendings(context),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red)),
                        child: const Text(
                          'Reject',
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
