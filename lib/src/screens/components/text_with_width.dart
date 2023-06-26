import 'package:arte_ctt_app/src/utils/app_styles.dart';
import 'package:flutter/material.dart';

class TextWithWidth extends StatelessWidget {
  const TextWithWidth({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Stack(
      children: [
        Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 3
              ..color = Styles.blue,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          text,
          style: TextStyle(
            color: Styles.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ));
  }
}
