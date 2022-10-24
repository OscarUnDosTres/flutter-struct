import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:undostresflutter/views/upload_file/image_picker.dart';
import 'dart:io';

class UploadFileView extends StatefulWidget {
  const UploadFileView({super.key});

  @override
  State<UploadFileView> createState() => _UploadFileView();
}

class _UploadFileView extends State<UploadFileView> {

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    ImagePickerProvider imagePickerProvider({required bool renderUI}) => Provider.of<ImagePickerProvider>(context, listen: renderUI);
    bool hasImages = imagePickerProvider(renderUI: true).selectedFiles.isNotEmpty;
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Image(
          image: AssetImage('assets/images/undostres_logo.png'),
          width: 180,
        ),
      ),
      body: Column(children: [
        if (!hasImages) 
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              child: 
                const Text(
                  "Pick files",
                ),
              onPressed: () {
                imagePickerProvider(renderUI: false).pickImages();
              }, 
            ),
          ),
        const SizedBox(height: 20),
        if (hasImages)
          const Text(
            "Double tap on file to remove",
          ),
        if (hasImages)
          Container(
            height: 200,
            width: 400,
            child: 
              ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: imagePickerProvider(renderUI: true).selectedFiles.length,
                itemBuilder: (BuildContext context, int index) {
                  File img = imagePickerProvider(renderUI: false).selectedFiles[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onDoubleTap: () {
                        imagePickerProvider(renderUI: false).removeFile( file: img );
                      },
                      child: Row( children:[
                        Container(
                          child: kIsWeb ? Image.memory(imagePickerProvider(renderUI: false).webImage, fit: BoxFit.fill) : Image.file(img),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          child: kIsWeb ? Text(imagePickerProvider(renderUI: false).webImage_name) : Text(img.path.toString().split("/")[img.path.toString().split("/").length-1]  ),
                        )
                      ]), 
                    )
                  );
                }
              ),
          ),
          
      ]),
    );
    
  }
}