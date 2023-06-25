import 'package:arte_ctt_app/src/domain/models/picture.dart';
import 'package:arte_ctt_app/src/screens/components/gradient_container.dart';
import 'package:arte_ctt_app/src/utils/app_styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetailsImage extends StatelessWidget {
  const DetailsImage({
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

  //bool _up = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: heightPicture,
          width: width,
          child: Hero(
            tag: picture.urlImage,
            child: FadeInImage(
              placeholder: const AssetImage("assets/images/loading1.gif"),
              image: CachedNetworkImageProvider(picture.urlImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
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
                          padding: const EdgeInsets.only(top: 15, left: 20),
                          child: Text(
                            picture.name,
                            style: Styles.textStyleTitle,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
