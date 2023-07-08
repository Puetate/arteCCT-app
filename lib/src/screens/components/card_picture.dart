import 'dart:ui';

import 'package:arte_ctt_app/src/domain/models/picture.dart';
import 'package:arte_ctt_app/src/screens/components/text_with_width.dart';
import 'package:arte_ctt_app/src/utils/app_layout.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CardPicture extends StatelessWidget {
  CardPicture({super.key, required this.picture}) {
    a = picture.imageUrl.split(dotenv.env["HOST"]!)[1].isEmpty;
  }
  final Picture picture;
  final String loadingUrl = "assets/images/loading1.gif";
  bool a = false;

  @override
  Widget build(BuildContext context) {
    final Size size = AppLayout.getSize(context);
    return InkWell(
      onTap: () => {
        Navigator.of(context).pushNamed('/picture_info', arguments: picture)
      },
      child: Card(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(children: [
            FadeInImage(
                height: 200,
                width: (size.width) / 2,
                fit: BoxFit.cover,
                placeholder: AssetImage(loadingUrl),
                image: a
                    ? AssetImage(loadingUrl) as ImageProvider
                    : CachedNetworkImageProvider(picture.imageUrl)),
            Positioned(
              bottom: 0,
              child: ClipRect(
                child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: Container(
                      width: (size.width - 32) / 2,
                      height: 40,
                      color: Colors.black.withOpacity(0),
                      child: TextWithWidth(text: picture.name),
                    )),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
