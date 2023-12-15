import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:waspha/core/const/colors/colors.dart';
import 'package:waspha/src/core/di/index.dart';
import 'package:waspha/src/features/custom_need/data/item_data.dart';
import 'package:waspha/src/features/custom_need/presentation/notifier/picker_notifire.dart';

class PhotoPickerDialog extends HookWidget {
  const PhotoPickerDialog({
    Key? key,
    required this.item,
  }) : super(key: key);
  final Item item;

  @override
  Widget build(BuildContext context) {

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
