import 'package:arte_ctt_app/src/data/datasource/api_repository_impl.dart';
import 'package:arte_ctt_app/src/data/datasource/pictures_proxy.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:provider/provider.dart';
import 'package:arte_ctt_app/src/providers/radio_provider.dart';
import 'package:arte_ctt_app/src/screens/components/tooltip_radio_player.dart';
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
  final tooltipController = JustTheController();
  bool isOpenTooltip = false;
  int _selectedIndex = 0;
  late ApiRepositoryImpl picturesService;
  late PictureProxy picturesProxy;

  void _onItemTapped(int index) {
    context.read<RadioProvider>().setIsCurrentPageRadio(false);
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOut,
      );
    });
  }

  void showTooltip() {
    tooltipController.showTooltip(autoClose: false, immediately: false);
  }

  @override
  void initState() {
    picturesService = ApiRepositoryImpl();
    picturesProxy = PictureProxy(picturesService);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              color: Styles.primaryColor,
              child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    HomeTab(
                      picturesProxy: picturesProxy,
                    ),
                    const ScannerTab(),
                    const SearchTab(),
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      Visibility(
                        visible: context.watch<RadioProvider>().playing &&
                            !context.watch<RadioProvider>().isCurrentPageRadio,
                        child: InkWell(
                          child: TooltipRadioPlayer(
                              tooltipController: tooltipController),
                          onTap: () => showTooltip,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(top: 3),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 1, color: Styles.buttonNBarBorderColor),
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
            ],
          ),
        ),
      ),
    );
  }
}
