import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final getContactProvider = StateProvider<String>((ref) => '');

class ContactList extends ConsumerWidget {
  const ContactList({super.key, required this.data});
  final List<Contact> data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Choose contact'),
        ),
        body: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  ref.read(getContactProvider.notifier).state =
                      data[index].phones.first.number;
                  Navigator.pop(context);
                },
                title: Text(data[index].displayName),
                subtitle: Text(data[index].phones.first.number),
              );
            }));
  }
}
