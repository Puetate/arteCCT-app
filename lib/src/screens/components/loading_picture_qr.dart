import 'package:arte_ctt_app/src/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoadingQR extends StatelessWidget {
  final Size size;
  const LoadingQR({super.key, required this.size});

  double getScanArea(Size size) =>
      (size.width < 400 || size.height < 400) ? 220 : 370;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Styles.blueGradient,
      height: size.height,
      child: Center(
        child: Container(
          height: getScanArea(size),
          width: getScanArea(size),
          decoration: BoxDecoration(
            color: Styles.primaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(15)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                color: Styles.white,
              ),
              const Gap(20),
              Text(
                textAlign: TextAlign.center,
                "Cargando obra\nPor favor espere...",
                style: Styles.textStyleTitleAgendaCultural
                    .copyWith(color: Styles.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
