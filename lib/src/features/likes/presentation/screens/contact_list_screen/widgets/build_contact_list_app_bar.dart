import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:waspha/core/const/colors/colors.dart';
import 'package:waspha/core/localization/localization.dart';
import 'package:waspha/src/widgets/custom_text_form_field/custom_text_form_field.dart';

class BuildContactListAppBar extends HookWidget {
  const BuildContactListAppBar({
    Key? key,
    required this.contactList,
    required this.searchController,
    required this.searchedContact,
  }) : super(key: key);
  final List<Contact> contactList;
  final TextEditingController searchController;
  final ValueNotifier<List<Contact>> searchedContact;

  @override
  Widget build(BuildContext context) {
    void addSearchedCharacterToList(String searchedCharacter) {
      searchedContact.value = contactList
          .where((contact) => contact.displayName
              .toLowerCase()
              .startsWith(searchedCharacter.toLowerCase()))
          .toList();
      debugPrint(
          'The Data Get From Search Contact Is ${searchedContact.value}');
    }

    return CustomTextFromField(
      textEditingController: searchController,
      onChanged: (String? searchedContact) {
        addSearchedCharacterToList(searchedContact ?? '');
      },
      hintText: context.localization.search_contacts,
    );
  }
}

class BuildAppBarActions extends HookWidget {
  const BuildAppBarActions({
    Key? key,
    required this.searchController,
    required this.isSearching,
  }) : super(key: key);
  final TextEditingController searchController;
  final ValueNotifier<bool> isSearching;

  @override
  Widget build(BuildContext context) {
    void _clearSearch() {
      searchController.clear();
    }

    void _stopSearching() {
      _clearSearch();
      isSearching.value = false;
    }

    void _startSearch() {
      ModalRoute.of(context)!
          .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
      isSearching.value = true;
    }

    return IconButton(
      onPressed: () {
        if (isSearching.value) {
          _clearSearch();
          context.pop();
        } else {
          _startSearch();
        }
      },
      icon: Icon(
        isSearching.value ? Icons.clear : Icons.search,
        color: WasphaColors.black,
      ),
    );
  }
}
