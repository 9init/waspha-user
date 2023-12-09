import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
@LazySingleton()
class ImagePickerProvider{
  final ImagePicker picker = ImagePicker();
  bool isImageChosen = false;
  String chossenImage = '';
  Future<void> chooseImageSource(String pickerType) async {
    final pickedImage = await _pickImage(pickerType);
    if (pickedImage != null) {
      chossenImage = base64Encode(pickedImage);
      isImageChosen = true;
    }
  }
  Future<List<int>?> _pickImage(String pickerType) async {
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
        final imageBytes = await file.readAsBytes();
        return imageBytes;
      } catch (e) {
        debugPrint('Error reading image file: $e');
        return null;
      }
    }
    return null;
  }
}
