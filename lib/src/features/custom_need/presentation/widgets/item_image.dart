import 'dart:convert';

import 'package:flutter/material.dart';
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
        showDialog(
          context: context,
          builder: (context) => PhotoPickerDialog(item: widget.item),
        ).then((_) {
          // This setState will trigger a rebuild when the dialog is closed
          setState(() {});
          //TODO//:Remove That setState After Finishing Study Riverpod Migration
        });
      },
      child: CircleAvatar(
        radius: 35,
        backgroundColor: Colors.grey[200],
        backgroundImage: widget.item.image!.isNotEmpty && widget.item.image != null
            ? MemoryImage(base64Decode(widget.item.image ?? ''))
            : null,
        child: widget.item.image!.isEmpty && widget.item.image != null
            ? Icon(Icons.add)
            : null,
      ),
    );
  }
}
