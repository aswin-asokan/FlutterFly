import 'package:flutter/material.dart';
import 'package:task5/pages/shop/cart.dart';
import 'package:task5/pages/shop/favorites.dart';
import 'package:task5/pages/home.dart';
import 'package:task5/pages/Settings/profile.dart';

class Navigate extends StatefulWidget {
  final int index;
  const Navigate(this.index, {super.key});

  @override
  State<Navigate> createState() => _NavigateState();
}

class _NavigateState extends State<Navigate> {
  late int currentPageIndex;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    currentPageIndex = widget.index;
    _pageController = PageController(initialPage: currentPageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      const Home(),
      const Cart(),
      const Favorites(),
      const Profile()
    ];
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        children: pages,
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.linearToEaseOut,
            );
          });
        },
        indicatorColor: const Color.fromRGBO(252, 151, 142, 1),
        selectedIndex: currentPageIndex,
        destinations: const <NavigationDestination>[
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_bag),
            label: 'Cart',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite),
            label: "Favorites",
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
