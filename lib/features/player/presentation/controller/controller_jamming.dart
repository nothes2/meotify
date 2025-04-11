import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class JammingController extends GetxController {
  final player = AudioPlayer();
  RxBool isPlaying = false.obs;
  RxDouble volume = 1.0.obs;

  Future<void> playSyncedMusic(String url, int serverTime) async {
    await player.setUrl(url);
    
    // Sync playback to start at a specific timestamp
    int now = DateTime.now().millisecondsSinceEpoch;
    int delay = serverTime - now + 1000; // +1s buffer
    if (delay > 0) await Future.delayed(Duration(milliseconds: delay));

    player.play();
    isPlaying.value = true;
  }

  void pause() {
    player.pause();
    isPlaying.value = false;
  }

  void setVolume(double value) {
    player.setVolume(value);
    volume.value = value;
  }

  @override
  void onClose() {
    player.dispose();
    super.onClose();
  }
}
