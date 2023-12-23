import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waspha/core/const/colors/colors.dart';
import 'package:waspha/core/di/index.dart';
import 'package:waspha/core/helper_functions/pick_image/picke_image.dart';

class PhotoPickerDialog extends HookWidget {
  const PhotoPickerDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final choosePickedImage = di<ImagePickerProvider>();
    return AlertDialog.adaptive(
      backgroundColor: WasphaColors.white,
      elevation: 0,

      content: SizedBox(
        height: 180.h,
        width: 220.w,
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
                Navigator.of(context).pop();
              }),
            ),
            ListTile(
              title: Text('From Camera'),
              leading: Icon(Icons.camera),
              onTap: () async => await choosePickedImage
                  .chooseImageSource('Camera')
                  .then((value) {
                Navigator.of(context).pop();
              }),
            ),
          ],
        ),
      ),
    );
  }
}
