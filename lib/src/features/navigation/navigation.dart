import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:waspha/src/features/activity/presentation/activity.dart';

import '../creditcard/presentation/creditcard.dart';
import '../likes/presentation/likes_screen.dart';
import '../nearby_stores/presentation/nearby_stores.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  List loadedPages = [
    0,
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      NearbyStoreScreen(),
      loadedPages.contains(1) ? const Activity() : Container(),
      loadedPages.contains(2) ? const LikesScreen() : Container(),
      loadedPages.contains(3) ? const CreditCardScreen() : Container(),

   
    ];

    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        currentIndex: currentIndex,
        onTap: (index) {
          var screens = loadedPages;
          if (!screens.contains(index)) {
            screens.add(index);
          }
          setState(() {
            currentIndex = index;
            loadedPages = screens;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_activity), label: "Activity"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Likes"),
          BottomNavigationBarItem(
              icon: Icon(Icons.credit_card), label: "Credit"),
        ],
      ),
    );
  }
}
