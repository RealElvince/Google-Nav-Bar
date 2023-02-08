import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:googlenavbar/navpages/home_page.dart';
import 'package:googlenavbar/navpages/profile_page.dart';
import 'package:googlenavbar/navpages/settings_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Selected Item Function
  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: const Text('Google Nav Bar'),
        centerTitle: true,
      ),

      // NavBar
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
          child: GNav(
            selectedIndex: _selectedIndex,
            onTabChange: onItemTapped,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey.shade800,
            padding: const EdgeInsets.all(16.0),
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            gap: 8.0,
            backgroundColor: Colors.black,
            color: Colors.white,
            tabs: [
              // Home nav
              GButton(
                onPressed: () {
                  setState(() {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HomePage()));
                  });
                },
                icon: Icons.home,
                text: 'Home',
              ),

              // Settings nav
              GButton(
                onPressed: () {
                  setState(() {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SettingPage()));
                  });
                  Navigator.pop(context);
                },
                icon: Icons.settings,
                text: 'Settings',
              ),

              // Profile nav
              GButton(
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ProfilePage()));
                  });
                },
                icon: Icons.person,
                text: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
