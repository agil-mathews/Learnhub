import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:learnhub/common/widgets/custom_button.dart';
import 'package:learnhub/common/widgets/custom_textfield.dart';
import 'package:learnhub/instructor/service/instructor_service.dart';
import 'package:learnhub/utils/utils.dart';
import 'package:permission_handler/permission_handler.dart';


class AddCourse extends StatefulWidget {
  const AddCourse({super.key});

  @override
  State<AddCourse> createState() => _AddCourseState();
}

// ignore: camel_case_types
class _AddCourseState extends State<AddCourse> {
  final TextEditingController courseTitleController = TextEditingController();
  final TextEditingController courseDescController = TextEditingController();
  final TextEditingController coursePriceController = TextEditingController();
  final TextEditingController coursevideoController = TextEditingController();
  final TextEditingController courseBriefDescController = TextEditingController();
  final TextEditingController courseReqController = TextEditingController();
  final InstructorService instructorService = InstructorService();

String category ='IT & development';
File? images ;
File? video;
String? _selectedVideoName; // Store selected file name



@override
  void dispose(){
  super.dispose();
  courseTitleController.dispose();
  courseDescController.dispose();
  coursePriceController.dispose();
  coursevideoController.dispose();
  courseBriefDescController.dispose();
  courseReqController.dispose();

}
List<String> courseCategories = [
  'IT & development',
  'Business',
  'Communication',
  'Environment',
  'Politics'
];

void selectImages() async{
   var status = await Permission.photos.request();
   if (kDebugMode) {
     print(status);
   }
if (status.isGranted) {
    var res = await pickImages();
    setState(() {
      images = res.first;
      // imageNames = res.map((image) => image.path.split('/').last).toList();

    });
  } else {
    // Handle the case where the user denies the permission
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Storage permission is required to select images.')),
    );
  }
}

void selectVideos() async{
   var status = await Permission.photos.request();
if (status.isGranted) {
    var res = await pickVideos();
    setState(() {
      video = res.first;
      _selectedVideoName = video!.path.split('/').last;
      coursevideoController.text = _selectedVideoName ?? '';
      // _selectedVideoName = video.name;
      // imageNames = res.map((image) => image.path.split('/').last).toList();

    });
  } else {
    // Handle the case where the user denies the permission
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Storage permission is required to select videos.')),
    );
  }
}

  void addCourse(){

      if (images == null || video == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Please select both an image and a video')),
    );
    return;
  }
    
    instructorService.addPending(
      context: context,
      
      name: courseTitleController.text,
      description: courseDescController.text,
      brief: courseBriefDescController.text,
      requirements: courseReqController.text,
      category: category,
      price: int.parse(coursePriceController.text),
      image: images!,
      video: video!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Add Course'),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:10),
            child: Column(
            children: [
              GestureDetector(
                onTap: selectImages,
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(10),
                  dashPattern: const [10,4],
                  strokeCap: StrokeCap.round,
                   child: Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  // ignore: unnecessary_null_comparison
                  child: images == null ?
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.folder_open,size: 40,),
                      const SizedBox(height: 15,),
                      Text('Select thumbnail image',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey.shade400,
                      ),),
                    ],
                  ) :
                  ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.file(
                                images!,
                                // images,
                                width: double.infinity,
                                height: 150,
                                fit: BoxFit.contain,
                              ),
                            ),

                )),
              ),
              const SizedBox(height: 30,),
              CustomTextField(
               controller: courseTitleController,
               hintText: 'Course Title'),
               const SizedBox(height: 10,),
              CustomTextField(
               controller: courseDescController,
               hintText: 'Course Description',
              //  maxLines: 7,
               ),
               const SizedBox(height: 10,),
               CustomTextField(
               controller: courseBriefDescController,
               hintText: 'Brief Description',
               maxLines: 7,),
               const SizedBox(height: 10,),
               CustomTextField(
               controller: courseReqController,
               hintText: 'Course Requirements'),
               const SizedBox(height: 10,),
              TextFormField(
                controller: coursevideoController,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black38,
          )
        ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: selectVideos,
                      child: const Text('Choose'),
                    ),
                  ),
                ),
                readOnly: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please pick an image';
                  }
                  return null;
                },
              ),
               const SizedBox(height: 10,),
              CustomTextField(
               controller: coursePriceController,
               hintText: 'Course Price'),
               const SizedBox(height: 10,),
               SizedBox(
                width: double.infinity,
                child: DropdownButton(
                  value: category,
                  items: courseCategories.map((String item) {
                    return DropdownMenuItem(value: item,child: Text(item),
                    );
                  }).toList(),
                   onChanged: (String? newVal){
                    setState(() {
                      category = newVal!;
                    });

                   },
                   ),
               ),
               const SizedBox(height: 10,),
               CustomButton(text: 'Add Course', onTap: addCourse)


            ],
                    ),
          )),
      ),
    );
  }
}
