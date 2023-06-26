import 'dart:ui';

import 'package:arte_ctt_app/src/screens/components/text_with_width.dart';
import 'package:arte_ctt_app/src/utils/app_layout.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CardPicture extends StatelessWidget {
  const CardPicture({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = AppLayout.getSize(context);
    return Card(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(children: [
          FadeInImage(
              height: 200,
              width: (size.width - 32)/2,
              fit: BoxFit.cover,
              placeholder: const AssetImage("assets/images/loading1.gif"),
              image: const CachedNetworkImageProvider(
                  'https://culturatungurahua.com/wp-content/uploads/2022/12/cuadro-24.gif')),
          Positioned(
            bottom: 0,
            child: ClipRect(
              child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: Container(
                    width: (size.width - 32)/2,
                    height: 40,
                    color: Colors.black.withOpacity(0),
                    child: const TextWithWidth(text: "Caballos briosos"),
                  )),
            ),
          )
        ]),
      ),
    );
  }
}
