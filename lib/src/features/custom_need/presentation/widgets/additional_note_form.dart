import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:waspha/src/features/custom_need/data/item_data.dart';
import 'package:waspha/src/widgets/custom_text_form_field/custom_text_form_field.dart';

class AdditionalNoteForm extends HookWidget {
  const AdditionalNoteForm( {Key? key, required this.item}) : super(key: key);
  final Item item;
  @override
  Widget build(BuildContext context) {
    final TextEditingController _nameController =
        useTextEditingController(text: item.name == null ? "" : item.name);

    final TextEditingController _noteController = useTextEditingController(
        text: item.additional_notes == null ? "" : item.additional_notes);
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 0),
        child: Column(
          children: [
            CustomTextFromField(
              textInputAction: TextInputAction.next,
              textEditingController: _nameController,
              onChanged: (String? value) {
                _nameController.text = value ?? '';
                item.name = value;
              },
              labelText: 'Item Summary',
              validator: (String?value){
                if(value!.isEmpty){
                  return'Kaml Ya M3rs';
                }
                return null;
              },
            ),
            CustomTextFromField(
              textEditingController: _noteController,
              onChanged: (String? value) {
                _noteController.text = value ?? '';
                item.additional_notes = value;
              },
              maxLines: 6,
              minLines: 1,
              labelText: 'Add a note',
              validator: (value){
                if(value!.isEmpty||value==null){
                  return'Kaml Ya M3rs';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}

