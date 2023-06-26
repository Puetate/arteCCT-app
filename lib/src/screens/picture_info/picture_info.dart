import 'package:arte_ctt_app/src/domain/models/picture.dart';
import 'package:arte_ctt_app/src/screens/components/gradient_container.dart';
import 'package:arte_ctt_app/src/screens/home/tabs/home_tab/components/details_image.dart';
import 'package:arte_ctt_app/src/screens/picture_info/components/history_bibliography_picture.dart';
import 'package:arte_ctt_app/src/utils/app_layout.dart';
import 'package:arte_ctt_app/src/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:text_to_speech/text_to_speech.dart';

class PictureInfoScreen extends StatefulWidget {
  const PictureInfoScreen({super.key});

  @override
  State<PictureInfoScreen> createState() => _PictureInfoScreenState();
}

class _PictureInfoScreenState extends State<PictureInfoScreen>
    with SingleTickerProviderStateMixin {
  TextToSpeech tts = TextToSpeech();
  late AnimationController _animationController;
  ScrollController controller = ScrollController();
  late Picture picture;
  double volume = 1; // Range: 0-1
  double rate = 1.0; // Range: 0-2
  double pitch = 1.0;
  String languageCode = 'es-EC';
  bool isSpeechPlaying = false;

  Future<void> speak(String description) async {
    tts.setVolume(volume);
    tts.setRate(rate);
    tts.setLanguage(languageCode);
    tts.setPitch(pitch);
    await tts.speak(description);
  }

  Future<void> _iconTapped(Picture picture) async {
    if (isSpeechPlaying == false) {
      _animationController.forward();
      controller.animateTo(controller.position.maxScrollExtent,
          duration: const Duration(seconds: 25), curve: Curves.linear);
      await speak(getInfoPictureToSpeech(picture));
      isSpeechPlaying = true;
    } else {
      _animationController.reverse();
      isSpeechPlaying = false;
      tts.stop();
    }
  }

  String getInfoPictureToSpeech(Picture picture) {
    return "${picture.name}. Historia. ${picture.description}. Autor. ${picture.author.bibliography}";
  }

  String getInfoPicture(Picture picture) {
    String description = "";
    if (picture.description != null) {
      description = picture.description;
    } else {
      description =
          "Pintada sobre ${picture.support}, se utilizó la técnica de ${picture.technique}. La obra titulada ${picture.name} pertenece al siglo XX. Proveniente de ${picture.country}, con dimensiones de ${picture.pieceHeight} cm de altura y ${picture.pieceWidth} cm de ancho. La obra se encuentra ubicada en la ${picture.location} de la casa de la cultura de Tungurahua.";
    }
    return description;
  }

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    controller.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (controller.offset >= controller.position.maxScrollExtent) {
      _animationController.reverse();
      isSpeechPlaying = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = AppLayout.getSize(context);
    final heightCover = (size.height - 90);

    picture = ModalRoute.of(context)!.settings.arguments as Picture;
    picture.description = getInfoPicture(picture);
    return Scaffold(
      backgroundColor: Styles.primaryColor,
      body: CustomScrollView(
        controller: controller,
        slivers: [
          SliverAppBar(
            iconTheme: IconThemeData(color: Styles.white),
            backgroundColor: Styles.primaryColor,
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
                                  GestureDetector(
                                    onTap: () => _iconTapped(picture),
                                    child: AnimatedIcon(
                                      color: Styles.white,
                                      icon: AnimatedIcons.play_pause,
                                      progress: _animationController,
                                      size: 70,
                                    ),
                                  )
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
