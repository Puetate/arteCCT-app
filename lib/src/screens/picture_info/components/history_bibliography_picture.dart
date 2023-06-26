import 'package:arte_ctt_app/src/domain/models/picture.dart';
import 'package:arte_ctt_app/src/utils/app_styles.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HistoryPibliographyPicture extends StatelessWidget {
  const HistoryPibliographyPicture({
    super.key,
    required this.picture,
  });

  final Picture picture;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(picture.name, style: Styles.textStyleTitle),
          Text.rich(
            TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: 'Historia:\n',
                    style: Styles.textStyleTitle
                        .copyWith(fontSize: 20, fontWeight: FontWeight.w400)),
                TextSpan(
                    text: picture.description,
                    style: Styles.textStyleTitle
                        .copyWith(fontSize: 15, fontWeight: FontWeight.w300)),
              ],
            ),
          ),
          const Gap(20),
          Row(
            children: [
              const Expanded(
                flex: 1,
                child: ClipOval(
                  child: Image(
                    image: AssetImage("assets/images/artist.gif"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            flex: 1,
                            child: AutoSizeText('Autor: ',
                                style: Styles.textStyleTitle.copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500))),
                        Expanded(
                          flex: 2,
                          child: AutoSizeText(
                            picture.author.fullName,
                            style: Styles.textStyleTitle.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Text(
                            picture.author.bibliography,
                            style: Styles.textStyleTitle.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
