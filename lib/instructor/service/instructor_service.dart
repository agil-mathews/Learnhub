import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:learnhub/instructor/screens/instructor_home.dart';
import 'package:learnhub/models/product.dart';
import 'package:learnhub/providers/pending_provider.dart';
import 'package:learnhub/providers/user_provider.dart';
import 'package:learnhub/utils/constants.dart';
import 'package:learnhub/utils/utils.dart';
import 'package:provider/provider.dart';


class InstructorService {
  void addPending({
    required BuildContext context,
     // ignore: non_constant_identifier_names
     int? Courseid,
    required String name,
    required String description,
    required String brief,
    required int price,
    required String category,
    required String requirements,
    required File? image,
    required File? video,
  }) async {
    try {

      // Initializing Cloudinary
      // final cloudinary = CloudinaryPublic('learnhub', 'learnhub', cache: false);
      String ?imageUrls;
      String? videoUrls;

     uploadFileToCloudinary(File imageFile) async {
    try {
      if (kDebugMode) {
        print(imageFile);
      }
      const cloudName = 'learnhub'; // Your Cloudinary cloud name
      // const uploadPreset = 'learnhub'; // Name of your Cloudinary upload preset
      final cloudinaryUploadEndpoint = Uri.parse('https://api.cloudinary.com/v1_1/$cloudName/upload');
      // Convert the image to base64
      // List<int> imageBytes = await imageFile.readAsBytes();
      // String base64Image = base64Encode(imageBytes);
      // print('data:image/jpeg;base64,$base64Image');

      // String image = 'data:image/jpeg;base64,$base64Image';

      // Create the body of the request
      
      // Map<String, dynamic> body = {
      //   'file': base64Image,
      //   'upload_preset': uploadPreset,
      // };

      // // Make the POST request
      // var response = await http.post(
      //   Uri.parse(cloudinaryUploadEndpoint),
      //   headers: {'Content-Type': 'application/json'},
      //   body: json.encode(body),
      // );
       var request = http.MultipartRequest('POST', cloudinaryUploadEndpoint)
        ..fields['upload_preset'] = 'learnhub'
        ..files.add( await http.MultipartFile.fromPath('file', imageFile.path));

        var response = await request.send();

      if (kDebugMode) {
        print(response);
      }
     
        if (response.statusCode == 200) {
        var responseData = await http.Response.fromStream(response);
        var data = json.decode(responseData.body);
        return data['secure_url'];
        
      } else {
        if (kDebugMode) {
          print('Failed to upload image: ${response.reasonPhrase}');
        }
        return null;
      }
      
      
    } catch (error) {
      if (kDebugMode) {
        print('Error uploading image to Cloudinary: $error');
      }
        if (error is SocketException) {
        if (kDebugMode) {
          print('SocketException: ${error.osError?.message}');
        }
      }
      return null;
    }
    
  }

  imageUrls= await uploadFileToCloudinary(image!);
  videoUrls = await uploadFileToCloudinary(video!);

  final user = Provider.of<UserProvider>(context, listen: false).user;
    
       Product product = Product(
        Courseid: Courseid,
        name: name,
        description: description, 
        brief: brief,
        requirements: requirements,
        category: category,
        price: price, 
        imagePath: imageUrls, 
        videoPath: videoUrls,
        userName:user.name,
        );

        http.Response resp = await http.post(
         Uri.parse('${Constants.uri}/requestcourse'),
         body: product.toJson(),
         headers: <String, String>{
          'Content-Type':'application/json; charset=UTF-8',
         },
      );
    
      if (kDebugMode) {
        print('Server response: ${resp.body}');
      }
      if (kDebugMode) {
        print("addcourse function");
      }

      // ignore: use_build_context_synchronously
      httpErrorHandle(
        response: resp, 
        context: context, 
        onSuccess: (){
          showSnackBar(context, 'Course requested ');
           Navigator.pushReplacement( 
          context,
          MaterialPageRoute(builder: (context) =>  const Instructor_home()),
       );
        });

    } catch (e) {
      showSnackBar(context, e.toString());
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void getAllPendings(
    BuildContext context,
  ) async{
    try {
      var pendingProvider = Provider.of<PendingProvider>(context, listen: false);
      
      http.Response res = await http.get(
        Uri.parse('${Constants.uri}/getallpending'),
        headers: <String, String>{
          'Content-Type':'application/json; charset=UTF-8',
        },
      ).timeout(const Duration(seconds: 60));
      var resBody = res.body;
      if (kDebugMode) {
        print('res.body: $resBody');
      }
      if (kDebugMode) {
        print('Response size: ${resBody.length} bytes');
      }

       // Log the response body to see if it gets cut off at some point
    for (int i = 0; i < resBody.length; i += 100) {
      if (kDebugMode) {
        print(resBody.substring(i, i + 100 > resBody.length ? resBody.length : i + 100));
      }
    }

      pendingProvider.setPending(res.body);


    } catch (e) {
      showSnackBar(context, e.toString());
      if (kDebugMode) {
        print("error: $e");
      }
    }
  }
  
  
  
  
}