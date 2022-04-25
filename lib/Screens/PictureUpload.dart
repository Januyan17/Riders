// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures
import 'dart:io';
import 'package:image_watermark/image_watermark.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PictureUpload extends StatefulWidget {
  const PictureUpload({Key? key}) : super(key: key);

  @override
  State<PictureUpload> createState() => _PictureUploadState();
}

class _PictureUploadState extends State<PictureUpload> {
  File? imageFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.deepPurple,
            size: 25.0,
          ),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: imageFile == null
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Text("No Image Selected"),
              )
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 400,
                      child: Image(
                        image: FileImage(imageFile!),
                      ),
                    ),
                    RaisedButton(
                      onPressed: () {
                        print("Image");
                      },
                      child: Text("Submit"),
                    )
                  ],
                ),
              ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => getImage(source: ImageSource.camera),
            child: Icon(Icons.camera),
          ),
          SizedBox(
            height: 15,
          ),
          FloatingActionButton(
            onPressed: () => getImage(source: ImageSource.gallery),
            child: Icon(Icons.image),
          )
        ],
      ),
    );
  }

  void getImage({required ImageSource source}) async {
    final file = await ImagePicker().pickImage(source: source);

    if (file?.path != null) {
      setState(() {
        imageFile = File(file!.path);
      });
    }
  }
}
