import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:waspha/src/features/custom_need/presentation/item_widget_collapsed.dart';
import 'package:waspha/src/features/custom_need/presentation/item_widget_expanded.dart';

import '../data/item_data.dart';

class CreateItemWidget extends HookWidget {
  CreateItemWidget({
    super.key,
    required this.item,
  });

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
                borderRadius: BorderRadius.circular(25))
            : null,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
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
                        GestureDetector(
                          child: Icon(Icons.delete),
                          onTap: () {
                            item.delete();
                          },
                        ),
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
                                  )),
                            )),
                      ],
                    ),
                  ),
                ),
                isCollapsed.value
                    ? ItemWidgetCollapsed(
                        isCollapsed: isCollapsed,
                        item: item,
                      )
                    : ItemWidgetExpanded(item: item)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
