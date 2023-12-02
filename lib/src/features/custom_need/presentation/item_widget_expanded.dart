import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:waspha/src/widgets/custom_text_form_field/custom_text_form_field.dart';

import '../data/item_data.dart';

// Assuming itemsProvider is a FutureProvider<String>
class ItemWidgetExpanded extends StatefulHookWidget {
  final Item item;

  ItemWidgetExpanded({super.key, required this.item});

  @override
  State<ItemWidgetExpanded> createState() => _ItemWidgetExpandedState();
}

class _ItemWidgetExpandedState extends State<ItemWidgetExpanded> {
  @override
  build(BuildContext context) {
    final counter = useState(1);
    final TextEditingController _nameController = useTextEditingController(
        text: widget.item.name == null ? "" : widget.item.name);

    final TextEditingController _noteController = useTextEditingController(
        text: widget.item.additional_notes == null
            ? ""
            : widget.item.additional_notes);

    print("Name: ${widget.item.name}");
    final pickedImagePath = useState<String?>(null);

    ImagePicker picker = ImagePicker();

    void _pickImage(ImagePicker picker) async {
      final XFile? image = await picker.pickImage(source: ImageSource.camera);

      if (image != null) {
        // Update the state with the selected image path
        pickedImagePath.value = image.path;
        debugPrint('The Image Is pickedImagePath ${pickedImagePath.value}');
      }
    }

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
                alignment: Alignment.topCenter,
                child: Consumer(
                  builder: (context, ref, child) {
                    return CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.grey[200],
                      backgroundImage: pickedImagePath.value != null
                          ? FileImage(File(pickedImagePath.value ?? ''))
                          : null,
                      child: pickedImagePath.value == null
                          ? IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                _pickImage(picker);
                              },
                            )
                          : null,
                    );
                  },
                )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 0),
                child: Column(
                  children: [
                    CustomTextFromField(
                      textInputAction: TextInputAction.next,
                      textEditingController: _nameController,
                      onChanged: (String? value) {
                        _nameController.text = value ?? '';
                        widget.item.name = value;
                      },
                      labelText: 'Item Summary',
                    ),
                    CustomTextFromField(
                      textEditingController: _noteController,
                      onChanged: (String? value) {
                        _noteController.text = value ?? '';
                        widget.item.additional_notes = value;
                      },
                      maxLines: 6,
                      minLines: 1,
                      labelText: 'Add a note',
                    ),
                  ],
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
                          Icons.remove,
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
