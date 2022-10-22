import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

class ImagePickerProvider extends ChangeNotifier {
  List<File> selectedFiles = [];
  Uint8List webImage = Uint8List(8);
  String webImage_name = "";

  Future<bool> pickImages() async {
    try {
      if (kIsWeb) {
        final ImagePicker pickerWeb = ImagePicker();
        var selectedImage = await pickerWeb.pickImage(source: ImageSource.gallery);
        
        if (selectedImage != null) {
          selectedFiles.add(File("a"));
          webImage_name = selectedImage.name;
          webImage = await selectedImage.readAsBytes();
          notifyListeners();

          return true;
        }
      } else if (Platform.isAndroid) {
        final picker = ImagePicker();
        var result = await picker.pickMultiImage();
        if (result != null) {
          result.forEach((kFile) { 
            selectedFiles.add(File(kFile.path));
            notifyListeners();
          });
          
          return true;
        }
      } else if (Platform.isIOS) {
        final filePickerResult = await FilePicker.platform.pickFiles(allowMultiple: true, type: FileType.image);
        if (filePickerResult != null) {
          List<String?> files = filePickerResult.paths;
          files.forEach((kFilePath) { 
            selectedFiles.add(File(kFilePath!));
            notifyListeners();
          });
          
          return true;
        }
      }

      return false;
    } catch (e) {
      return false;
    }
  }

  List<File> getImages() {
    return selectedFiles;
  }

  void removeFile({required File file}) {
    selectedFiles.remove(file);
    notifyListeners();
  }

}