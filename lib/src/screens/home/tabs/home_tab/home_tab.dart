import 'package:arte_ctt_app/src/data/in_memory_pictures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:arte_ctt_app/src/data/datasource/api_repository_impl.dart';
import 'package:arte_ctt_app/src/domain/models/picture.dart';
import 'package:arte_ctt_app/src/screens/components/gradient_container.dart';
import 'package:arte_ctt_app/src/screens/home/tabs/home_tab/components/picture_component.dart';
import 'package:arte_ctt_app/src/utils/app_layout.dart';
import 'package:arte_ctt_app/src/utils/app_styles.dart';


class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  ApiRepositoryImpl serviceApi = ApiRepositoryImpl();

  @override
  Widget build(BuildContext context) {
    final Size size = AppLayout.getSize(context);

    final picturesFrontPages = [
      PictureFrontPage(
        heightPicture: (size.height - 112),
        width: size.width,
        heightGradient: (size.height * 0.13),
        picture: pictures[1],
      ),
      PictureFrontPage(
        heightPicture: (size.height - 112),
        width: size.width,
        heightGradient: (size.height * 0.13),
        picture: pictures[2],
      ),
      PictureFrontPage(
        heightPicture: (size.height - 112),
        width: size.width,
        heightGradient: (size.height * 0.13),
        picture: pictures[3],
      )
    ];

    String assetName = 'assets/svg/RCCT.svg';
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView(
        children: [
          Stack(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...picturesFrontPages,
                  ],
                ),
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
                      "Buenos Dias",
                      style: Styles.textStyleTitle,
                    ),
                  ),
                  
                ],
              ),
            ],
          ),
          const Gap(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
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
                      'assets/images/RCCT.png',
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
              onPressed: () async {},
            ),
          ),
        ],
      ),
    );
  }
}

/* 
SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: FutureBuilder<List<Picture>>(
                  future: serviceApi.getPictures(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return snapshot.data!.isNotEmpty
                          ? ListView.builder(
                              itemCount: snapshot.data?.length,
                              itemBuilder: (context, index) {
                                final picture = snapshot.data![index];
                                return PictureFrontPage(
                                  heightPicture: (size.height - 112),
                                  width: size.width,
                                  heightGradient: (size.height * 0.13),
                                  picture: picture,
                                );
                              },
                            )
                          : const Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 15),
                                child: Text(
                                  "No existen pinturas destacadas",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Styles.primaryColor,
                        ),
                      );
                    }
                  },
                ),
              ), */
