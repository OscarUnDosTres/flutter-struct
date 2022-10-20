import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

class ImagePickerProvider extends ChangeNotifier {
  List<File> selectedFiles = [];

  Future<bool> pickImages() async {
    try {
      if (Platform.isAndroid) {
        final picker = ImagePicker();
        var result = await picker.pickMultiImage();
        if (result != null) {
          result.forEach((kFile) { 
            selectedFiles.add(File(kFile.path));
            notifyListeners();
          });

          log(selectedFiles.length.toString());
          
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
      } else if (kIsWeb) {
        log("hola");
        final pickerWeb = ImagePicker();
        var selectedImage = await pickerWeb.pickImage(source: ImageSource.gallery);
        if (selectedImage != null) {
          selectedFiles.add(File(selectedImage.path));
          
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