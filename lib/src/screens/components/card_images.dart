import 'package:arte_ctt_app/src/domain/models/picture.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CardImage extends StatelessWidget {
  final Picture picture;
  const CardImage({super.key, required this.picture});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          splashColor: Colors.red,
          /* onTap: () {
            picture.copy();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MostrarReceta(
                          carruselImages: carruselImages,
                        )));
          }, */
          child: FadeInImage(
            placeholder: const AssetImage("assets/images/loading1.gif"),
            image: /* AssetImage(picture.image) */
                CachedNetworkImageProvider(picture.image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
