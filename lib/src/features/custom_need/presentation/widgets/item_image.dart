import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:waspha/core/di/index.dart';
import 'package:waspha/core/helper_functions/pick_image/picke_image.dart';
import 'package:waspha/src/features/custom_need/data/item_data.dart';
import 'package:waspha/src/features/custom_need/presentation/widgets/photo_picker_dialog.dart';

class ItemImage extends StatefulWidget {
  const ItemImage({Key? key, required this.item}) : super(key: key);
  final Item item;

  @override
  State<ItemImage> createState() => _ItemImageState();
}

class _ItemImageState extends State<ItemImage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final choosePickedImage = di<ImagePickerProvider>();
        showAdaptiveDialog(
          context: context,
          builder: (context) => PhotoPickerDialog(),
        ).then((value) {
          debugPrint('The Value Is $value');
          debugPrint(
              'The Image Taken Is ${choosePickedImage.chosenImageString}');
          widget.item.image = choosePickedImage.chosenImageString;
          // This setState will trigger a rebuild when the dialog is closed
          setState(() {});
          //TODO//:Remove That setState After Finishing Study Riverpod Migration
        });
      },
      child: CircleAvatar(
        radius: 35,
        backgroundColor: Colors.grey[200],
        backgroundImage:
            widget.item.image!.isNotEmpty && widget.item.image != null
                ? MemoryImage(base64Decode(widget.item.image ?? ''))
                : null,
        child: widget.item.image!.isEmpty && widget.item.image != null
            ? Icon(Icons.add)
            : null,
      ),
    );
  }
}
