import 'package:audioplayers/audioplayers.dart';

abstract class AlertHelper {
  static startAlarm({required bool isEnter}) async {
    final player = AudioPlayer();
    player.setVolume(1);
    if (isEnter) {
      await player.play(AssetSource('audio/enter.mp3'));
    } else {
      await player.play(AssetSource('audio/exit.mp3'));
    }
  }
}
