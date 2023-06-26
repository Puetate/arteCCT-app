import 'package:flutter/material.dart';
import 'package:flutter_radio_player/flutter_radio_player.dart';
import 'package:flutter_radio_player/models/frp_source_modal.dart';

enum RadioState {
  stopped("STOPPED");

  final String name;
  const RadioState(this.name);
}

class RadioProvider with ChangeNotifier {
  final radioTitle = "Radio CTT";
  // final String urlRadio = 'https://radio42.globalhost1.com/8048/stream';
  final String urlRadio =
      'https://mdstrm.com/audio/60a2745ff943100826374a70/icecast.audio';
  final FlutterRadioPlayer _radioPlayer = FlutterRadioPlayer();
  bool _playing = false;
  bool _isCurrentPageRadio = false;
  late FRPSource frpSource;
  bool get playing => _playing;
  bool get isCurrentPageRadio => _isCurrentPageRadio;
  FlutterRadioPlayer get radioPlayer => _radioPlayer;

  void setIsCurrentPageRadio(bool value) {
    _isCurrentPageRadio = value;
    notifyListeners();
  }

  Future<bool> checkRadioStreamState() async {
    String state = await _radioPlayer.getPlaybackState();
    return state == RadioState.stopped.name;
  }

  void togglePlaying() async {
    bool radioStopped = await checkRadioStreamState();
    if (radioStopped) return;
    _radioPlayer.playOrPause();
    _playing = !playing;
    notifyListeners();
  }

  initRadioPlayer() {
    frpSource = FRPSource(
      mediaSources: <MediaSources>[
        MediaSources(
          url: urlRadio,
          description: radioTitle,
          isPrimary: true,
          title: radioTitle,
          isAac: true,
        ),
      ],
    );
    _radioPlayer.initPlayer();
    _radioPlayer.addMediaSources(frpSource);
    _radioPlayer.seekToMediaSource(0, false);
  }

  RadioProvider() {
    initRadioPlayer();
  }
}
