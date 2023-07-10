import 'dart:async';

import 'package:arte_ctt_app/src/providers/manager_proxy_provider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:arte_ctt_app/src/data/datasource/pictures_proxy.dart';
import 'package:arte_ctt_app/src/domain/models/picture.dart';
import 'package:arte_ctt_app/src/screens/components/card_images.dart';
import 'package:arte_ctt_app/src/screens/home/tabs/home_tab/components/radio_button.dart';
import 'package:arte_ctt_app/src/utils/app_layout.dart';
import 'package:arte_ctt_app/src/utils/app_styles.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatefulWidget {
  final PictureProxy picturesProxy;
  const HomeTab({super.key, required this.picturesProxy});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int indexTabRadio = 3;
  var assetsImageRCCT = 'assets/images/RCCT.png';
  String titleFeaturedPictures = 'Obras Destacadas';
  List<Picture> featuredPictures = List<Picture>.empty(growable: true);
  final title = "Casa de la cultura Tungurahua";
  final String cttLogoPath = "assets/images/cct_logo.png";

  bool _isLoading = true;

  Future refresh(bool needReset) async {
    setState(() {
      if (featuredPictures.isNotEmpty) featuredPictures.clear();
      _isLoading = true;
    });
    List<Picture> picturesData = await context
        .read<ManagerProxyProvider>()
        .getFeaturedPictures(needReset);
    setState(() {
      featuredPictures = picturesData;
      if (featuredPictures.isEmpty) _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    refresh(false);
    Timer(const Duration(seconds: 2), () {
      if (!mounted) return;
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.primaryColor,
      body: RefreshIndicator(
        backgroundColor: Styles.primaryColor,
        color: Styles.white,
        onRefresh: () => refresh(true),
        child: ListView(
          children: [
            Center(
              child: Column(
                children: [
                  const Gap(30),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Styles.secondary, width: 8),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(cttLogoPath)),
                  ),
                  const Gap(30),
                  Text(title.toUpperCase(),
                      style: TextStyle(color: Styles.white, fontSize: 20)),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    titleFeaturedPictures,
                    style: Styles.textStyleTitle
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            //* -------------> CAROUSEL PINTURAS
            const Gap(5),

            (featuredPictures.isNotEmpty)
                ? CarouselSlider.builder(
                    itemCount: featuredPictures.length,
                    options: CarouselOptions(
                      enableInfiniteScroll: false,
                      autoPlay: true,
                      height: 200.0,
                      autoPlayCurve: Curves.easeInOut,
                      enlargeCenterPage: true,
                      autoPlayInterval: const Duration(seconds: 5),
                    ),
                    itemBuilder: (context, index, realIdx) {
                      final pictureCarousel = featuredPictures[index];
                      return CardImage(
                        picture: pictureCarousel,
                      );
                    },
                  )
                : SizedBox(
                    height: 200,
                    child: Center(
                      child: (_isLoading)
                          ? CircularProgressIndicator(
                              color: Styles.white,
                            )
                          : Icon(
                              Icons.wifi_off_rounded,
                              color: Styles.white,
                              size: 30,
                            ),
                    ),
                  ),
            const Gap(30),

            // * -------------> BOTÓN RADIO
            const RadioButton(),
            //* -------------> BOTÓN AGENDA CULTURAL
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 40, right: 40),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Styles.transparent,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Styles.white),
                      borderRadius: BorderRadius.circular(35)),
                  padding: const EdgeInsets.symmetric(vertical: 5),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Ver Agenda Cultural",
                        style: Styles.textStyleTitle.copyWith(fontSize: 18),
                      ),
                      Icon(
                        Icons.chevron_right_rounded,
                        color: Styles.white,
                        size: 30,
                      )
                    ],
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/cultural_agenda');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
