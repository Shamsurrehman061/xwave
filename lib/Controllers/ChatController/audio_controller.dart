



import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

class ChatAudioController extends GetxController{


  final isPlaying = false.obs;
  AudioPlayer _audioPlayer = AudioPlayer();

  void togglePlayback(var audioFIlePath) async {
    if (isPlaying.value) {
      isPlaying.value = false;
      await _audioPlayer.pause();
    } else {
      isPlaying.value = true;
      await _audioPlayer.setSourceDeviceFile(audioFIlePath); // Replace with your audio file path
    }
  }

}