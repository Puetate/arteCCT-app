import 'package:flutter/material.dart';
import 'package:radio_player/radio_player.dart';

class RadioProvider with ChangeNotifier {
  final String urlRadio = 'https://radio42.globalhost1.com/8048/stream';
  // final String urlRadio= 'https://playerservices.streamtheworld.com/api/livestream-redirect/ECUADOR_SC?dist=onlineradiobox';
  // final String urlRadio= 'https://mdstrm.com/audio/60a2745ff943100826374a70/icecast.audio';
  final RadioPlayer _radioPlayer = RadioPlayer();
  bool _playing = false;
  bool _isCurrentPageRadio = false;

  bool get playing => _playing;
  bool get isCurrentPageRadio => _isCurrentPageRadio;
  RadioPlayer get radioPlayer => _radioPlayer;

  void setIsCurrentPageRadio(bool value) {
    _isCurrentPageRadio = value;
    notifyListeners();
  }

  void setPlaying(bool value) {
    _playing = value;
    notifyListeners();
  }

  initRadioPlayer() {
    _radioPlayer.setChannel(
      title: 'Radio Player',
      url: urlRadio,
    );
    _radioPlayer.stateStream.listen((value) {
      setPlaying(value);
    });
    _radioPlayer.metadataStream.listen((value) {});
  }

  RadioProvider() {
    initRadioPlayer();
  }
}
