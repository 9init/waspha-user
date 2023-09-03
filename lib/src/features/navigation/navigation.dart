import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../home/home.dart';
import '../nearby_stores/presentation/nearby_stores.dart';

class Navigation extends HookWidget {
  const Navigation({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedIndex = useState(0);
    const pages = [
      NearbyStoreScreen(),
      HomeScreen(),
    ];
    return Scaffold(
      body: pages[selectedIndex.value],
      
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        
        indicatorColor: const Color.fromARGB(255, 221, 221, 220),
        selectedIndex: selectedIndex.value,
        onDestinationSelected: (index) => selectedIndex.value = index,
        
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          NavigationDestination(
            icon: Icon(Icons.home),
            label: "Home",
          ),
        ],
      ),
    );
  }
}
