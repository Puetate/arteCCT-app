import 'dart:async';

import 'package:arte_ctt_app/src/data/datasource/api_repository_impl.dart';
import 'package:arte_ctt_app/src/screens/components/loading_picture_qr.dart';
import 'package:arte_ctt_app/src/utils/app_layout.dart';
import 'package:arte_ctt_app/src/utils/app_styles.dart';
import 'package:arte_ctt_app/src/utils/snackbars.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScannerTab extends StatefulWidget {
  const ScannerTab({super.key});

  @override
  State<ScannerTab> createState() => _ScannerTabState();
}

class _ScannerTabState extends State<ScannerTab> {
  QRViewController? controller;
  String idResultScanner = "";
  final GlobalKey qrKey = GlobalKey(debugLabel: "QR");
  bool _isLoading = true;
  bool _isLoadingPicture = false;
  double getScanArea(Size size) =>
      (size.width < 400 || size.height < 400) ? 220 : 370;

  @override
  void initState() {
    super.initState();
    if (mounted) {
      Timer(const Duration(seconds: 1), () {
        if (!mounted) return;
        setState(() {
          _isLoading = false;
        });
      });
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      getPicture(scanData.code!);
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        MySnackBars.warningSnackBar(
            'Por favor habilite los permisos de uso de cámara.', 'Permisos!'),
      );
    }
  }

  Future<void> getPicture(String id) async {
    setState(() => _isLoadingPicture = true);
    controller?.pauseCamera();
    final service = ApiRepositoryImpl();
    return await service.getPicture(id).then((picture) async {
      if (picture == null) {
        setState(() => _isLoadingPicture = false);
        controller?.resumeCamera();
        return;
      }

      await Navigator.of(context)
          .pushNamed('/picture_info', arguments: picture);
      if (!mounted) return;
      controller?.resumeCamera();
      setState(() => _isLoadingPicture = false);
    }).onError((error, stackTrace) {
      controller?.resumeCamera();
      setState(() => _isLoadingPicture = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = AppLayout.getSize(context);

    return Column(
      children: [
        Expanded(
          flex: 1,
          child: (_isLoading)
              ? Center(
                  child: Icon(
                  Icons.qr_code_scanner_rounded,
                  size: size.width / 2,
                  color: Styles.white,
                ))
              : Stack(
                  children: [
                    QRView(
                      key: qrKey,
                      onQRViewCreated: _onQRViewCreated,
                      overlay: QrScannerOverlayShape(
                          borderColor: Colors.red,
                          borderRadius: 10,
                          borderLength: 30,
                          borderWidth: 10,
                          cutOutSize: getScanArea(size)),
                      onPermissionSet: (ctrl, p) =>
                          _onPermissionSet(context, ctrl, p),
                    ),
                    Visibility(
                        visible: _isLoadingPicture,
                        child: LoadingQR(size: size))
                  ],
                ),
        ),
      ],
    );
  }
}
