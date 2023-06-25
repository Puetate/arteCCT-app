import 'package:arte_ctt_app/src/domain/models/picture.dart';
import 'package:arte_ctt_app/src/screens/components/gradient_container.dart';
import 'package:arte_ctt_app/src/screens/home/tabs/home_tab/components/cover_image.dart';
import 'package:arte_ctt_app/src/screens/home/tabs/home_tab/components/details_image.dart';
import 'package:arte_ctt_app/src/screens/picture_info/components/history_bibliography_picture.dart';
import 'package:arte_ctt_app/src/utils/app_layout.dart';
import 'package:arte_ctt_app/src/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:text_to_speech/text_to_speech.dart';

class PictureInfoScreen extends StatefulWidget {
  const PictureInfoScreen({super.key});

  @override
  State<PictureInfoScreen> createState() => _PictureInfoScreenState();
}

class _PictureInfoScreenState extends State<PictureInfoScreen> {
  TextToSpeech tts = TextToSpeech();
  double volume = 1; // Range: 0-1
  double rate = 1.0; // Range: 0-2
  double pitch = 1.0;
  String languageCode = 'es-EC';

  Future<void> speak(String description) async {
    tts.setVolume(volume);
    tts.setRate(rate);
    tts.setLanguage(languageCode);
    tts.setPitch(pitch);
    tts.speak(description);
  }

  String getInfoPictureToSpeech(Picture picture) =>
      "${picture.name}. historia. ${picture.description} Autor. ${picture.autor}. ${picture.bibliography}";

  @override
  Widget build(BuildContext context) {
    final Size size = AppLayout.getSize(context);
    final heightCover = (size.height - 90);
    ScrollController controller = ScrollController();

    final picture = ModalRoute.of(context)!.settings.arguments as Picture;
    return Scaffold(
      backgroundColor: Styles.primaryColor,
      body: CustomScrollView(
        controller: controller,
        slivers: [
          SliverAppBar(
            iconTheme: IconThemeData(color: Styles.white),
            backgroundColor: Styles.primaryColor,
            floating: true,
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: heightCover,
                      child: DetailsImage(
                        heightPicture: heightCover,
                        width: size.width,
                        heightGradient: (size.height * 0.13),
                        picture: picture,
                      ),
                    ),
                    GradientContainer(
                        turn: 0,
                        withContainer: size.width,
                        heightContainer: (size.height * 0.13)),
                    SizedBox(
                      height: heightCover,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Transform.translate(
                            offset: const Offset(0, -50),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 25),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.play_circle_outline_rounded,
                                      size: 70,
                                      color: Styles.white,
                                    ),
                                    tooltip: 'Escuchar Historia de Pintura',
                                    onPressed: () {
                                      controller.animateTo(
                                          controller.position.maxScrollExtent,
                                          duration: Duration(seconds: 25),
                                          curve: Curves.linear);

                                      speak(getInfoPictureToSpeech(picture));
                                    },
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: heightCover,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.keyboard_arrow_down_rounded,
                                size: 40,
                                color: Styles.white.withOpacity(0.5),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                HistoryPibliographyPicture(picture: picture)
              ],
            ),
          ]))
        ],
      ),
    );
  }
}
