import 'package:arte_ctt_app/src/domain/models/picture.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:arte_ctt_app/src/data/in_memory_pictures.dart';
import 'package:arte_ctt_app/src/screens/components/card_images.dart';
import 'package:arte_ctt_app/src/data/datasource/api_repository_impl.dart';
import 'package:arte_ctt_app/src/screens/components/gradient_container.dart';
import 'package:arte_ctt_app/src/screens/home/tabs/home_tab/components/cover_image.dart';
import 'package:arte_ctt_app/src/utils/app_layout.dart';
import 'package:arte_ctt_app/src/utils/app_styles.dart';

typedef OnIndexTab = Function(int index);

class HomeTab extends StatefulWidget {
  final OnIndexTab onIndexTab;
  const HomeTab({super.key, required this.onIndexTab});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  ApiRepositoryImpl serviceApi = ApiRepositoryImpl();
  int indexTabRadio = 3;

  @override
  Widget build(BuildContext context) {
    final Size size = AppLayout.getSize(context);
    final service = ApiRepositoryImpl();

    var assetsImageRCCT = 'assets/images/RCCT.png';
    final heightCover = (size.height - 112);
    String titleFeaturedPicures = 'Pinturas Destacadas';
    return Scaffold(
      backgroundColor: Styles.primaryColor,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  titleFeaturedPicures,
                  style: Styles.textStyleTitle
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.chevron_right_sharp,
                  color: Styles.white,
                  size: 40,
                )
              ],
            ),
          ),
          //* -------------> CAROUSEL PINTURAS
          const Gap(5),

          FutureBuilder<List<Picture>>(
            future: service.getPictures(),
            builder: (context, snapshot) {
              if (snapshot.hasData &&
                  snapshot.connectionState == ConnectionState.done) {
                List<Picture> pictures = snapshot.data!;
                return CarouselSlider.builder(
                  itemCount: pictures.length,
                  options: CarouselOptions(
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    height: 200.0,
                    autoPlayCurve: Curves.easeInOut,
                    enlargeCenterPage: true,
                    autoPlayInterval: const Duration(seconds: 5),
                  ),
                  itemBuilder: (context, index, realIdx) {
                    final pictureCarousel = pictures[index];
                    return CardImage(
                      picture: pictureCarousel,
                    );
                  },
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),

          //* -------------> BOTÓN RADIO
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Styles.secondary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35)),
                padding: const EdgeInsets.symmetric(vertical: 1),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      assetsImageRCCT,
                      height: 65,
                    ),
                    Icon(
                      Icons.play_circle_filled_rounded,
                      color: Styles.white,
                      size: 50,
                    )
                  ],
                ),
              ),
              onPressed: () {
                widget.onIndexTab(indexTabRadio);
              },
            ),
          ),
        ],
      ),
    );
  }
}
