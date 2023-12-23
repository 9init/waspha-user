import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/core/localization/localization.dart';
import 'package:waspha/src/features/likes/presentation/screens/contact_list_screen/widgets/build_contact_list_app_bar.dart';

final getContactProvider = StateProvider<String>((ref) => '');
final getUserNameContactProvider = StateProvider<String>((ref) => '');

class ContactList extends HookWidget {
  const ContactList({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController =
        useTextEditingController();
    final ValueNotifier<bool> isSearching = useState(false);
    final ValueNotifier<List<Contact>> _contacts = useState([]);
    final ValueNotifier<bool> _permissionDenied = useState(false);
    final ValueNotifier<List<Contact>> searchedContact = useState([]);

    Future _fetchContacts() async {
      if (!await FlutterContacts.requestPermission(readonly: true)) {
        _permissionDenied.value = true;
      } else {
        final contacts = await FlutterContacts.getContacts(
          withProperties: true,
          withPhoto: true,
          withGroups: true,
          withAccounts: true,
        );
        _contacts.value = contacts;
      }
    }

    useEffect(() {
      _fetchContacts();
      return null;
    }, []);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          BuildAppBarActions(
            searchController: searchController,
            isSearching: isSearching,
          ),
        ],
        leading: isSearching.value ? Container() : BackButton(),
        title: isSearching.value
            ? BuildContactListAppBar(
                contactList: _contacts.value,
                searchController: searchController,
                searchedContact: searchedContact,
              )
            : Text(
                context.localization.choose_contact,
                style: Theme.of(context).textTheme.titleSmall,
              ),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          return ListView.builder(
            itemCount: isSearching.value
                ? searchedContact.value.length
                : _contacts.value.length,
            itemBuilder: (context, index) {
              return FutureBuilder(
                future: FlutterContacts.getContact(isSearching.value
                    ? searchedContact.value[index].id
                    : _contacts.value[index].id),
                builder: (context, snapShot) {
                  if (snapShot.hasData) {
                    return ListTile(
                      onTap: () {
                        ref.read(getContactProvider.notifier).state =
                            snapShot.data!.phones.first.number;
                        ref.read(getUserNameContactProvider.notifier).state =
                            snapShot.data!.displayName;

                        Navigator.pop(context);
                      },
                      title: Text(snapShot.data!.displayName),
                      subtitle: Text(
                          '${snapShot.data!.phones.isNotEmpty ? snapShot.data!.phones.first.number : '(none)'}'),
                      leading: const CircleAvatar(
                        child: Icon(Icons.person),
                      ),
                    );
                  } else {
                    Text(context.localization.permission_denied);
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
