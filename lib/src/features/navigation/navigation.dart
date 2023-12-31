import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:waspha/src/features/activity/presentation/activity.dart';

import '../creditcard/presentation/screens/payment_methods_screen/payment_methods_screen.dart';
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

class CustomNavigation extends StatelessWidget {
  const CustomNavigation({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;
  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: navigationShell.currentIndex,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        onTap: _goBranch,
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
