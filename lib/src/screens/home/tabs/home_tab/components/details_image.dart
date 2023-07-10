import 'package:arte_ctt_app/src/domain/models/picture.dart';
import 'package:arte_ctt_app/src/screens/components/gradient_container.dart';
import 'package:arte_ctt_app/src/utils/app_layout.dart';
import 'package:arte_ctt_app/src/utils/app_styles.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DetailsImage extends StatefulWidget {
  DetailsImage({
    super.key,
    required this.width,
    required this.heightGradient,
    required this.picture,
    required this.heightPicture,
  }) {
    isUrlImage = picture.imageUrl.split(dotenv.env["HOST"]!)[1].isEmpty;
  }
  final double width;
  final double heightGradient;
  final double heightPicture;
  final Picture picture;
  bool isUrlImage = false;

  @override
  State<DetailsImage> createState() => _DetailsImageState();
}

class _DetailsImageState extends State<DetailsImage> {
  final String loadingUrl = "assets/images/loadingLg.gif";

  //bool _up = false;
  @override
  Widget build(BuildContext context) {
    final Size size = AppLayout.getSize(context);

    return Stack(
      children: [
        SizedBox(
          height: widget.heightPicture,
          width: widget.width,
          child: Hero(
            tag: widget.picture.code,
            child: FadeInImage(
              placeholder: AssetImage(loadingUrl),
              image: (widget.isUrlImage)
                  ? AssetImage(loadingUrl) as ImageProvider
                  : CachedNetworkImageProvider(
                      (widget.picture.imageWordpressUrl != "")
                          ? widget.picture.imageWordpressUrl
                          : widget.picture.imageUrl,
                      errorListener: () {
                        setState(() {
                          widget.isUrlImage = true;
                        });
                      },
                    ),
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
                    withContainer: widget.width,
                    heightContainer: widget.heightGradient),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15, left: 20),
                      child: SizedBox(
                        width: size.width - 90,
                        child: Text(
                          textAlign: TextAlign.left,
                          widget.picture.name,
                          style: Styles.textStyleTitle,
                        ),
                      ),
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
