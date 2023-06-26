import 'package:arte_ctt_app/src/utils/app_styles.dart';
import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer(
      {super.key,
      required this.withContainer,
      required this.heightContainer,
      required this.turn});
  final double withContainer;
  final double heightContainer;
  final int turn;

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: turn,
      child: Wrap(
        children: [
          Container(
            width: withContainer,
            height: heightContainer,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Styles.gradient_0,
                Styles.gradient_1,
                Styles.gradient_2,
                Styles.gradient_3,
              ],
            )),
          )
        ],
      ),
    );
  }
}
