import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/src/features/custom_need/presentation/providers/item_list_provider.dart';
import 'package:waspha/src/features/custom_need/presentation/widgets/item_image.dart';

import '../data/item_data.dart';

class ItemWidgetCollapsed extends StatelessWidget {
  final ValueNotifier<bool> isCollapsed;
  final Item item;

  const ItemWidgetCollapsed({
    super.key,
    required this.isCollapsed,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return Dismissible(
          key: ValueKey(item.id),
          onDismissed: (value) => ref.read(itemListProvider.notifier).removeItem(item: item),
          background: Container(
            color: Colors.red,
            child: Icon(
              Icons.delete,
              color: Colors.white,
              size: 50,
            ),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  )
                ],
                borderRadius: BorderRadius.circular(25)),
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ItemImage(
                    item: item,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, top: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(item.name ?? "Item Summary",
                              overflow: TextOverflow.ellipsis, maxLines: 1),
                          Text(
                            item.additional_notes ?? "Notes",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => isCollapsed.value = false,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        radius: 13,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.arrow_drop_down,
                          size: 25,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

      },
    );
  }
}
