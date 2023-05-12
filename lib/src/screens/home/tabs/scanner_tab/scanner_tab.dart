import 'package:flutter/material.dart';

class ScannerTab extends StatefulWidget {
  const ScannerTab({super.key});

  @override
  State<ScannerTab> createState() => _ScannerTabState();
}

class _ScannerTabState extends State<ScannerTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Scanner")),
    );
  }
}
