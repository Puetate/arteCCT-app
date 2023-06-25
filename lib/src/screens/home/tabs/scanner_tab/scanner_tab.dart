import 'dart:async';

import 'package:arte_ctt_app/src/data/datasource/api_repository_impl.dart';
import 'package:arte_ctt_app/src/utils/app_layout.dart';
import 'package:arte_ctt_app/src/utils/app_styles.dart';
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
    controller.scannedDataStream.listen((scanData) async {
      getPicture(scanData.code!);
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sin Permisos')),
      );
    }
  }

  Future<void> getPicture(String id) async {
    controller?.pauseCamera();
    final service = ApiRepositoryImpl();
    return await service.getPicture(id).then((picture) async {
      await Navigator.of(context)
          .pushNamed('/picture_info', arguments: picture);
      if (!mounted) return;
      controller?.resumeCamera();
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
              : QRView(
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
        ),
      ],
    );
  }
}
