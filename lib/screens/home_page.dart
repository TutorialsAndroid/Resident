import 'package:flutter/material.dart';
import 'package:resident/res/colors.dart';
import 'package:resident/res/strings.dart';
import 'package:resident/screens/community_screen.dart';
import 'package:resident/screens/feed_screen.dart';
import 'package:resident/screens/services_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const String _feedIconPath = 'assets/icons/announce.png';
  static const String _communityIconPath = 'assets/icons/community.png';
  static const String _serviceIconPath = 'assets/icons/service.png';
  static const double _iconSizeWidth = 30;
  static const double _iconSizeHeight = 30;

  static const String _feed = 'Feed';
  static const String _community = 'Community';
  static const String _services = 'Services';

  // List of screens
  static const List<Widget> _screens = <Widget>[
    FeedScreen(),
    CommunityScreen(),
    ServicesScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          Strings.appName,
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        elevation: 4.0, // This will add a shadow below the AppBar
        shadowColor: Colors.black.withOpacity(
            0.5), // Optional: customize the shadow color and opacity
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              _feedIconPath,
              width: _iconSizeWidth,
              height: _iconSizeHeight,
            ),
            label: _feed,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              _communityIconPath,
              width: _iconSizeWidth,
              height: _iconSizeHeight,
            ),
            label: _community,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              _serviceIconPath,
              width: _iconSizeWidth,
              height: _iconSizeHeight,
            ),
            label: _services,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.secondaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
