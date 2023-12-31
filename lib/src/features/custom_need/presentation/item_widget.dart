import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/src/features/custom_need/presentation/item_widget_collapsed.dart';
import 'package:waspha/src/features/custom_need/presentation/item_widget_expanded.dart';
import 'package:waspha/src/features/custom_need/presentation/providers/item_list_provider.dart';

import '../data/item_data.dart';

class CreateItemWidget extends HookWidget {
  CreateItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    final isCollapsed = useState(false);

    return Padding(
      padding: isCollapsed.value
          ? EdgeInsets.zero
          : EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: !isCollapsed.value
            ? BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  )
                ],
                borderRadius: BorderRadius.circular(25),
              )
            : null,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Visibility(
                visible: !isCollapsed.value,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 3,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Consumer(builder: (context, ref, child) {
                        return GestureDetector(
                          child: Icon(Icons.delete),
                          onTap: () => ref
                              .read(itemListProvider.notifier)
                              .removeItem(item: item),
                        );
                      }),
                      GestureDetector(
                        onTap: () => isCollapsed.value = true,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            shape: BoxShape.circle,
                          ),
                          child: CircleAvatar(
                            radius: 13,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.arrow_drop_up,
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
              isCollapsed.value
                  ? ItemWidgetCollapsed(
                      isCollapsed: isCollapsed,
                      item: item,
                    )
                  : ItemWidgetExpanded(item: item),
            ],
          ),
        ),
      ),
    );
  }
}
