import 'package:car_store_app/core/constants/my_color.dart';
import 'package:car_store_app/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final ValueNotifier<int> _currentIndexNotifier = ValueNotifier<int>(0);

  final List<Widget> _pages = const [
    HomePage(),
    Center(child: Text('Bookmarks Page', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: MyColor.textPrimary))),
    Center(child: Text('Notifications Page', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: MyColor.textPrimary))),
    Center(child: Text('Profile Page', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: MyColor.textPrimary))),
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: _currentIndexNotifier,
      builder: (context, currentIndex, child) {
        return Scaffold(
          body: _pages[currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) => _currentIndexNotifier.value = index,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: MyColor.accentBlue,
            unselectedItemColor: MyColor.textSecondary,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark_border),
                activeIcon: Icon(Icons.bookmark),
                label: 'Bookmarks',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications_none),
                activeIcon: Icon(Icons.notifications),
                label: 'Notifications',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                activeIcon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }
}
