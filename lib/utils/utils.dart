import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



void showSnackBar(BuildContext context, String message) {
  if (ScaffoldMessenger.maybeOf(context) != null && context.mounted) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message),behavior: SnackBarBehavior.floating,margin: EdgeInsets.all(20),));
  }
}


void httpErrorHandle({
  required http.Response response,
    context,
  required VoidCallback onSuccess,
  ScaffoldMessenger? scaffoldMessenger,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    
    case 400:
      // Check if the response body is not empty before decoding it
      if (response.body.isNotEmpty) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final String errorMessage = responseData['message'] ?? 'Unknown error';
        showSnackBar(context, errorMessage);
      } else {
        showSnackBar(context, 'Unknown error');
      }
      break;
    case 500:
      if (response.body.isNotEmpty) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final String errorMessage = responseData['error'] ?? 'Unknown error';
        showSnackBar(context, errorMessage);
      } else {
        showSnackBar(context, 'Unknown error');
      }
      break;
    default:
      // Show the entire response body as the error message
      showSnackBar(context, 'Unknown error: ${response.body}');
  }
}

Future<List<File>> pickImages() async{
  List<File> images = [];
  try {
    var files =  await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );
    if(files != null && files.files.isNotEmpty){
      for(int i = 0; i< files.files.length; i++){
        images.add(File(files.files[i].path!));
      }
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  return images;
}

Future<List<File>> pickVideos() async{
  List<File> videos = [];
  try {
    var files =  await FilePicker.platform.pickFiles(
      type: FileType.video,
      allowMultiple: true,
    );
    if(files != null && files.files.isNotEmpty){
      for(int i = 0; i< files.files.length; i++){
        videos.add(File(files.files[i].path!));
      }
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  return videos;
}