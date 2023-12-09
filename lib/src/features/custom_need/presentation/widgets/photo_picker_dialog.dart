import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:waspha/src/colors/colors.dart';
import 'package:waspha/src/core/di/index.dart';
import 'package:waspha/src/features/custom_need/data/item_data.dart';
import 'package:waspha/src/features/custom_need/helpers/picke_image.dart';

class PhotoPickerDialog extends HookWidget {
  const PhotoPickerDialog({
    Key? key,
    required this.item,
  }) : super(key: key);
  final Item item;

  @override
  Widget build(BuildContext context) {
    // final ValueNotifier<ImagePicker> picker =useState( ImagePicker());
    // Future<List<int>?> _pickImage(String pickerType) async {
    //   XFile? pickedImage;
    //   switch (pickerType) {
    //     case 'Gallery':
    //       pickedImage = await picker.value.pickImage(source: ImageSource.gallery);
    //       break;
    //     case 'Camera':
    //       pickedImage = await picker.value.pickImage(source: ImageSource.camera);
    //       break;
    //   }
    //
    //   if (pickedImage != null) {
    //     try {
    //       final file = File(pickedImage.path);
    //       final imageBytes = await file.readAsBytes();
    //       return imageBytes;
    //     } catch (e) {
    //       debugPrint('Error reading image file: $e');
    //       return null;
    //     }
    //   }
    //   return null;
    // }

    // Future<void> chooseImageSource(String pickerType) async {
    //   final pickedImage = await _pickImage(pickerType);
    //   if (pickedImage != null) {
    //     item.image = base64Encode(pickedImage);
    //   }
    // }
    final choosePickedImage = di<ImagePickerProvider>();
    return AlertDialog(
      backgroundColor: WasphaColors.white,
      content: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              title: Text('From Gallery'),
              leading: Icon(Icons.image),
              onTap: () async => await choosePickedImage
                  .chooseImageSource('Gallery')
                  .then((value) {
                item.image = choosePickedImage.chossenImage;

                Navigator.of(context).pop();
              }),
            ),
            ListTile(
              title: Text('From Camera'),
              leading: Icon(Icons.camera),
              onTap: () async => await choosePickedImage
                  .chooseImageSource('Camera')
                  .then((value) {
                item.image = choosePickedImage.chossenImage;

                Navigator.of(context).pop();
              }),
            ),
          ],
        ),
      ),
    );
  }
}
