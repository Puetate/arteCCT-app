import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:iconsax/iconsax.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:arte_ctt_app/src/screens/home/tabs/artist_tab/artist_tab.dart';
import 'package:arte_ctt_app/src/screens/home/tabs/home_tab/home_tab.dart';
import 'package:arte_ctt_app/src/screens/home/tabs/radio_tab/radio_tab.dart';
import 'package:arte_ctt_app/src/screens/home/tabs/scanner_tab/scanner_tab.dart';
import 'package:arte_ctt_app/src/screens/home/tabs/search_tab/search_tab.dart';
import 'package:arte_ctt_app/src/utils/app_styles.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: /* Container(
        decoration: BoxDecoration(
          color: Styles.primaryColor,
        ),
        child: Center(
          child: _widgetOptions[_selectedIndex],
        ),
      ), */
          Container(
        color: Styles.primaryColor,
        child: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              HomeTab(),
              ScannerTab(),
              SearchTab(),
              ArtistTab(),
              RadioTab()
            ]),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(top: 3),
        decoration: BoxDecoration(
          border: const Border(
            top: BorderSide(
              width: 1,
              color: Color.fromARGB(255, 176, 217, 255),
            ),
          ),
          color: Styles.onPrimary,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: GNav(
            gap: 8,
            haptic: true,
            color: Styles.onSecondary,
            activeColor: Styles.onSecondary,
            tabBackgroundColor: Styles.containerNavButton,
            selectedIndex: _selectedIndex,
            onTabChange: _onItemTapped,
            padding: const EdgeInsets.all(10),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: "Inicio",
              ),
              GButton(
                icon: Icons.qr_code_rounded,
                text: "Scanner",
              ),
              GButton(
                icon: Icons.search,
                text: "Buscar",
              ),
              GButton(
                icon: Icons.face_retouching_natural,
                text: "Artistas",
              ),
              GButton(
                icon: Icons.radio,
                text: "Radio",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
