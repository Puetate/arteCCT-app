import 'dart:math';

import 'package:arte_ctt_app/src/providers/radio_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MusicVisualizer extends StatefulWidget {
  const MusicVisualizer({super.key, required this.height, required this.width});
  final double height;
  final double width;

  @override
  State<MusicVisualizer> createState() => _MusicVisualizer();
}

class _MusicVisualizer extends State<MusicVisualizer> {
  List<Color> colors = [
    Colors.redAccent,
    Colors.redAccent,
    Colors.redAccent,
    Colors.redAccent
  ];
  List<int> duration = [900, 700, 600, 800, 500];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List<Widget>.generate(
            15,
            (index) => VisualComponent(
                duration: duration[index % 5], color: colors[index % 4])),
      ),
    );
  }
}

class VisualComponent extends StatefulWidget {
  const VisualComponent(
      {super.key, required this.duration, required this.color});
  final int duration;
  final Color color;
  @override
  State<VisualComponent> createState() => _VisualComponentState();
}

class _VisualComponentState extends State<VisualComponent>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animController;
  int _random = 10 + Random().nextInt(100 - 10);

  double getAnimationValue() {
    if (!animController.isAnimating) animController.repeat(reverse: true);
    return animation.value;
  }

  double getDefaultAnimationValue() {
    animController.stop();
    return _random.toDouble();
  }

  @override
  void initState() {
    super.initState();
    animController = AnimationController(
        duration: Duration(milliseconds: widget.duration), vsync: this);
    final curvedAnimation =
        CurvedAnimation(parent: animController, curve: Curves.easeInOutCubic);
    animation = Tween<double>(begin: 0, end: 100).animate(curvedAnimation)
      ..addListener(() {
        setState(() {});
      });

    animController.repeat(reverse: true);
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 10,
        decoration: BoxDecoration(
            color: widget.color, borderRadius: BorderRadius.circular(5)),
        height: context.watch<RadioProvider>().playing
            ? getAnimationValue()
            : getDefaultAnimationValue());
  }
}
