import 'package:flutter/material.dart';

class ArtistTab extends StatefulWidget {
  const ArtistTab({super.key});

  @override
  State<ArtistTab> createState() => _ArtistTabState();
}

class _ArtistTabState extends State<ArtistTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Artistas"),
      ),
    );
  }
}
