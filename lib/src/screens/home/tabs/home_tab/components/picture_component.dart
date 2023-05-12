import 'package:arte_ctt_app/src/domain/models/picture.dart';
import 'package:arte_ctt_app/src/screens/components/gradient_container.dart';
import 'package:arte_ctt_app/src/utils/app_styles.dart';
import 'package:flutter/material.dart';

class PictureFrontPage extends StatelessWidget {
  const PictureFrontPage({
    super.key,
    required this.width,
    required this.heightGradient,
    required this.picture,
    required this.heightPicture,
  });
  final double width;
  final double heightGradient;
  final double heightPicture;
  final Picture picture;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Stack(
          children: [
            Container(
              height: heightPicture,
              width: width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/image_1.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Stack(
                    children: [
                      GradientContainer(
                          turn: 2,
                          withContainer: width,
                          heightContainer: heightGradient),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 15, left: 20),
                                child: Text(
                                  picture.name,
                                  style: Styles.textStyleTitle,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.keyboard_arrow_down_rounded,
                                size: 40,
                                color: Styles.white,
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
