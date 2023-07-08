import 'package:arte_ctt_app/src/animations/audio_wave_animation.dart';
import 'package:arte_ctt_app/src/providers/radio_provider.dart';
import 'package:arte_ctt_app/src/utils/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../utils/app_styles.dart';

class RadioButton extends StatefulWidget {
  const RadioButton({super.key});

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton>
    with SingleTickerProviderStateMixin {
  String assetsImageRCCT = 'assets/images/RCCT.png';
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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
            color: Styles.secondary, borderRadius: BorderRadius.circular(35)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                assetsImageRCCT,
                height: 100,
                width: 100,
              ),
              Container(
                alignment: AlignmentDirectional.center,
                child: MusicVisualizer(
                  height: 60,
                  width: 140,
                  elementsNumber: 10,
                ),
              ),
              Container(
                height: 45,
                child: FittedBox(
                  child: FloatingActionButton(
                      shape: const CircleBorder(),
                      backgroundColor: Styles.white,
                      onPressed: () {
                        context.read<RadioProvider>().togglePlaying();
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
