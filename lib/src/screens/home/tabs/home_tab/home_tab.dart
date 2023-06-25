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

  @override
  Widget build(BuildContext context) {
    final Size size = AppLayout.getSize(context);

    var assetsImageRCCT = 'assets/images/RCCT.png';
    final heightCover = (size.height - 112);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  //* ------------> CARRUSEL CAVER IMAGE
                  CarouselSlider.builder(
                    itemCount: pictures.length - 3,
                    options: CarouselOptions(
                      height: heightCover,
                      viewportFraction: 1.0,
                      enlargeCenterPage: false,
                      // autoPlay: false,
                    ),
                    itemBuilder: (context, index, realIdx) {
                      final coverImage = pictures[index];
                      return CoverImage(
                        heightPicture: heightCover,
                        width: size.width,
                        heightGradient: (size.height * 0.13),
                        picture: coverImage,
                      );
                    },
                  ),

                  GradientContainer(
                      turn: 0,
                      withContainer: size.width,
                      heightContainer: (size.height * 0.13)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15, left: 20),
                        child: Text(
                          "Pinturas Destacadas",
                          style: Styles.textStyleTitle.copyWith(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: heightCover,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Styles.transparent,
                        ),
                        Transform.translate(
                          offset: const Offset(0, -10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.chevron_right_rounded,
                                size: 40,
                                color: Styles.white.withOpacity(0.7),
                              ),
                            ],
                          ),
                        ),
                        Transform.translate(
                          offset: const Offset(0, -10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.keyboard_arrow_down_rounded,
                                size: 40,
                                color: Styles.white.withOpacity(0.5),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Pinturas',
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
          CarouselSlider.builder(
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
                widget.onIndexTab(4);
              },
            ),
          ),
        ],
      ),
    );
  }
}
