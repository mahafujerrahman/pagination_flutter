import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'app/routes/app_pages.dart'; // Make sure to add the image_picker dependency

class MyImagePickerScreen extends StatefulWidget {
  @override
  _MyImagePickerScreenState createState() => _MyImagePickerScreenState();
}

class _MyImagePickerScreenState extends State<MyImagePickerScreen> {
  File? selectedImage;

  // Function to pick an image
  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image Picker Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            selectedImage == null
                ? Text('No image selected.')
                : Container(
              height: 200,
              width: 200,
              child: Image.file(selectedImage!),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: pickImage,
              child: Text("Pick Image"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: (){
                Get.toNamed(Routes.Pagination);
              },
              child: Text("Show List"),
            ),
          ],
        ),
      ),
    );
  }
}
