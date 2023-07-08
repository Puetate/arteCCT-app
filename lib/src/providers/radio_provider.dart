import 'package:arte_ctt_app/src/global/global_variable.dart';
import 'package:arte_ctt_app/src/utils/snackbars.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

enum RadioEvent {
  playing("flutter_radio_playing"),
  paused("flutter_radio_paused"),
  stopped("flutter_radio_stopped"),
  error("flutter_radio_error"),
  loading("flutter_radio_loading");

  final String name;
  const RadioEvent(this.name);
}

Map<String, bool> playingStatus = {
  RadioEvent.playing.name: true,
  RadioEvent.paused.name: false,
  RadioEvent.stopped.name: false,
  RadioEvent.error.name: false,
  RadioEvent.loading.name: false,
};

class RadioProvider with ChangeNotifier {
  final radioTitle = "Radio CTT";
  final String urlRadio = 'https://radio42.globalhost1.com/8048/stream';
  final String radioOfflineTittle = "Error";
  final String radioOfflineMessage = "Radio fuera de servicio";
  final AudioPlayer _audioPlayer = AudioPlayer();

  bool _playing = false;
  bool _isCurrentPageRadio = false;
  bool _isError = false;

  bool get playing => _playing;
  bool get isError => _isError;
  bool get isCurrentPageRadio => _isCurrentPageRadio;

  void setIsCurrentPageRadio(bool value) {
    _isCurrentPageRadio = value;
    notifyListeners();
  }

  void togglePlaying() async {
    if (_isError) {
      ScaffoldMessenger.of(GlobalVariable.navigatorState.currentContext!)
          .showSnackBar(MySnackBars.warningSnackBar(
              radioOfflineMessage, radioOfflineTittle));
      return;
    }
    (_audioPlayer.playing) ? _audioPlayer.pause() : _audioPlayer.play();
    _playing = _audioPlayer.playing;
    notifyListeners();
  }

  initRadioPlayer(bool startPlaying) async {
    try {
      _audioPlayer.setUrl(urlRadio);
      await _audioPlayer.load();
    } catch (e) {
      _isError = true;
    }
  }

  RadioProvider() {
    initRadioPlayer(false);
  }
}
