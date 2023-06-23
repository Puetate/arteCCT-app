import 'package:arte_ctt_app/src/animations/audio_wave_animation.dart';
import 'package:arte_ctt_app/src/data/datasource/api_repository_impl.dart';
import 'package:arte_ctt_app/src/providers/radio_provider.dart';
import 'package:arte_ctt_app/src/utils/app_layout.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:provider/provider.dart';

import '../../utils/app_styles.dart';

class TooltipRadioPlayer extends StatefulWidget {
  late AnimationController controller;
  TooltipRadioPlayer({
    super.key,
    required this.tooltipController,
  });

  final JustTheController tooltipController;

  @override
  State<TooltipRadioPlayer> createState() => _TooltipRadioPlayerState();
}

class _TooltipRadioPlayerState extends State<TooltipRadioPlayer>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = AppLayout.getSize(context);
    final service = ApiRepositoryImpl();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: JustTheTooltip(
        isModal: true,
        controller: widget.tooltipController,
        backgroundColor: Styles.blueGradient,
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  children: [
                    FloatingActionButton(
                        shape:
                            CircleBorder(side: BorderSide(color: Styles.white)),
                        backgroundColor: Styles.blue,
                        onPressed: () {
                          context.read<RadioProvider>().playing
                              ? context.read<RadioProvider>().radioPlayer.stop()
                              : context
                                  .read<RadioProvider>()
                                  .radioPlayer
                                  .play();
                          // animationControl();
                        },
                        child: AnimatedIcon(
                          icon: context.watch<RadioProvider>().playing
                              ? AnimatedIcons.pause_play
                              : AnimatedIcons.play_pause,
                          progress: animation,
                          color: Styles.white,
                          size: 35,
                        )),
                    MusicVisualizer(
                      height: 60,
                      width: size.width - 100,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        child: badges.Badge(
          position: badges.BadgePosition.topEnd(top: -10, end: -5),
          showBadge: false,
          ignorePointer: true,
          badgeContent: const Text(" "),
          badgeAnimation: const badges.BadgeAnimation.slide(),
          child: const Icon(Icons.abc_outlined, size: 27, color: Colors.white),
        ),
      ),
    );
  }
}
