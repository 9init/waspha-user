
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:waspha/src/features/custom_need/presentation/widgets/item_image.dart';
import 'package:waspha/src/features/custom_need/presentation/widgets/user_counter.dart';
import 'package:waspha/src/features/custom_need/presentation/widgets/additional_note_form.dart';

import '../data/item_data.dart';
class ItemWidgetExpanded extends HookWidget {
  final Item item;

  ItemWidgetExpanded({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: ItemImage(item: item,),
            ),
            AdditionalNoteForm(item: item,),
          ],

        ),
        ItemQuantityCounter(item: item,),

      ],
    );
  }
}
