import 'package:arte_ctt_app/src/domain/models/agenda.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CardAgenda extends StatelessWidget {
  const CardAgenda({super.key, required this.agenda});
  final Agenda agenda;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8,
      ),
      child: Card(
          semanticContainer: true,
          elevation: 2,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          child: SizedBox(
            width: double.maxFinite,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: const InkWell(
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
                  filterQuality: FilterQuality.medium,
                  placeholder: AssetImage("assets/images/loading1.gif"),
                  image: CachedNetworkImageProvider(
                      'https://culturatungurahua.com/wp-content/uploads/2023/05/ExaltacionYCoronacion.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          )),
    );
  }
}