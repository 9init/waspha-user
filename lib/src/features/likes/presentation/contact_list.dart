import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final getContactProvider = StateProvider<String>((ref) => '');

class ContactList extends HookWidget {
  const ContactList({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<List> _contacts = useState([]);
    final ValueNotifier<bool> _permissionDenied = useState(false);
    Future _fetchContacts() async {
      if (!await FlutterContacts.requestPermission(readonly: true)) {
        _permissionDenied.value = true;
      } else {
        final contacts = await FlutterContacts.getContacts();
        _contacts.value = contacts;
      }
    }

    useEffect(() {
      _fetchContacts();
      return null;
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: Text('Choose contact'),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          return ListView.builder(
            itemCount: _contacts.value.length,
            itemBuilder: (context, index) {
              debugPrint(
                  '${_contacts.value[index].phones.isNotEmpty ? _contacts.value[index].phones.first.number : '(none)'}');
              return FutureBuilder(
                future: FlutterContacts.getContact(_contacts.value[index].id),
                builder: (context, snapShot) {
                  if (snapShot.hasData) {
                    return ListTile(
                      onTap: () {
                        ref.read(getContactProvider.notifier).state =
                            snapShot.data!.phones.first.number;
                        Navigator.pop(context);
                      },
                      title: Text( snapShot.data!.displayName),
                      subtitle: Text(
                          '${ snapShot.data!.phones.isNotEmpty ?  snapShot.data!.phones.first.number : '(none)'}'),
                    );
                  } else {
                    Text('Premisson Dneid');
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
