import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class ImagePickerProvider {
  final ImagePicker picker = ImagePicker();
  bool isImageChosen = false;
  String chosenImageString = '';
  String chosenImagePath = '';

  Future<void> chooseImageSource(String pickerType) async {
    final pickedImage = await _pickImage(pickerType);
    if (pickedImage != null) {
      chosenImagePath = pickedImage.path;
      chosenImageString = base64Encode(await pickedImage.readAsBytes());
      isImageChosen = true;
    }
  }

  Future<File?> _pickImage(String pickerType) async {
    XFile? pickedImage;
    switch (pickerType) {
      case 'Gallery':
        pickedImage = await picker.pickImage(source: ImageSource.gallery);
        break;
      case 'Camera':
        pickedImage = await picker.pickImage(source: ImageSource.camera);
        break;
    }

    if (pickedImage != null) {
      try {
        final file = File(pickedImage.path);
        return file;
      } catch (e) {
        debugPrint('Error reading image file: $e');
        return null;
      }
    }
    return null;
  }
}
