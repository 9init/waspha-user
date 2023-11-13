import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/item_data.dart';

class ItemWidgetExpanded extends StatefulHookConsumerWidget {
  final Item item;
  ItemWidgetExpanded({super.key, required this.item});

  @override
  ConsumerState<ItemWidgetExpanded> createState() => _ItemWidgetExpandedState();
}

class _ItemWidgetExpandedState extends ConsumerState<ItemWidgetExpanded> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final counter = useState(1);
    final TextEditingController _nameController = TextEditingController(
        text: widget.item.name == null ? "" : widget.item.name);

    final TextEditingController _noteController = TextEditingController(
        text: widget.item.additional_notes == null
            ? ""
            : widget.item.additional_notes);

    saveItem() {
      final itemName = _nameController.text;
      final itemNotes = _noteController.text;
      if (itemName.isNotEmpty) {
        setState(() {
          widget.item.name = itemName;
          widget.item.additional_notes = itemNotes;
        });
      }
    }

    print("Name: ${widget.item.name}");

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.grey[200],
                  backgroundImage:
                      CachedNetworkImageProvider(widget.item.image ?? ""),
                  child: widget.item.image == null
                      ? Icon(
                          Icons.add,
                        )
                      : null),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        controller: _nameController,
                        onChanged: (value) {
                          _nameController.text = value;
                          widget.item.name = value;
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Item Summary',
                        ),
                      ),
                      TextFormField(
                        controller: _noteController,
                        onChanged: (value) {
                          _noteController.text = value;
                          widget.item.additional_notes = value;
                        },
                        maxLines: 6,
                        minLines: 1,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Add a note',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 25,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.open_in_full)),
              SizedBox(
                width: 95,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.white,
                      child: IconButton(
                        alignment: Alignment.center,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          if (widget.item.quantity > 1) {
                            counter.value = widget.item.quantity - 1;
                            widget.item.quantity = counter.value;
                          }
                        },
                        icon: Icon(
                          Icons.minimize,
                          size: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text("${widget.item.quantity}"),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.white,
                      child: Center(
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            counter.value = widget.item.quantity + 1;
                            widget.item.quantity = counter.value;
                          },
                          icon: Center(
                            child: Icon(
                              Icons.add,
                              size: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
