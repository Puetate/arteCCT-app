import 'package:arte_ctt_app/src/animations/audio_wave_animation.dart';
import 'package:arte_ctt_app/src/providers/radio_provider.dart';
import 'package:arte_ctt_app/src/utils/app_layout.dart';
import 'package:arte_ctt_app/src/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:radio_player/radio_player.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab>
    with SingleTickerProviderStateMixin {
  final String cttLogoPath = "assets/images/cct_logo.png";
  final title = "Casa de la cultura Tungurahua";
  final RadioPlayer _radioPlayer = RadioPlayer();

  late AnimationController controller;
  late Animation<double> animation;

  animationControl() {
    context.read<RadioProvider>().playing
        ? controller.forward()
        : controller.reverse();
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<RadioProvider>().setIsCurrentPageRadio(true);
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = AppLayout.getSize(context);

    return Scaffold(
      backgroundColor: Styles.primaryColor,
      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                const Gap(60),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Styles.secondary, width: 30),
                    borderRadius: const BorderRadius.all(Radius.circular(25)),
                  ),
                  padding: const EdgeInsets.all(30),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(cttLogoPath)),
                ),
                const Gap(30),
                Text(title.toUpperCase(),
                    style: TextStyle(color: Styles.white, fontSize: 20)),
                const Gap(30),
                MusicVisualizer(
                  height: 100,
                  width: size.width,
                ),
                const Gap(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Styles.magenta, shape: BoxShape.circle),
                      child: FloatingActionButton(
                          shape: const CircleBorder(),
                          backgroundColor: Styles.white,
                          onPressed: () {
                            context.read<RadioProvider>().playing ? 
                              context.read<RadioProvider>().radioPlayer.stop():
                              context.read<RadioProvider>().radioPlayer.play();
                          },
                          child: AnimatedIcon(
                            icon: context.watch<RadioProvider>().playing
                                ? AnimatedIcons.pause_play
                                : AnimatedIcons.play_pause,
                            progress: animation,
                            color: Styles.magenta,
                            size: 35,
                          )),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
