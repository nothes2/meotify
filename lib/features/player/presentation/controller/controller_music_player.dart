import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:meowdify/core/domain/entities/en_track.dart';
import 'package:meowdify/core/domain/entities/en_user.dart';
import 'package:meowdify/core/utilities/flutter_secure_storage_repo_impl.dart';
import 'package:meowdify/features/player/data/repository/repo_audio.dart';

class AudioController extends GetxController {
  final AudioPlayer audioPlayer = AudioPlayer();
  var isPlaying = false.obs;
  var currentPosition = Duration.zero.obs;
  var totalDuration = Duration.zero.obs;
  RxList<TrackInfo> queue = <TrackInfo>[].obs;
  final storage = Get.put(SecureStorageRepositoryImpl());
  final audioRepo = Get.put(AudioRepository());

  RxDouble volume = 0.5.obs;
  var isDragging = false.obs;
  var dragValue = 0.0.obs;

  final String link =
      "http://localhost:3000/music/67ecb27b1c7a4c35b09d81c6/67f9e64b9e6ab136d829d41a/1744430658280-Dankidz_-_Statue.mp3";

  @override
  void onInit() {
    super.onInit();
    _setupAudioPlayer();
  }

  // Start dragging for the progress bar
  void startDragging(double value) {
    isDragging.value = true;
    dragValue.value = value;
  }

  // Update the progress value while dragging
  void updateDragging(double value) {
    dragValue.value = value;
  }

  // End dragging and seek to the correct position
  void endDragging(double value) {
    isDragging.value = false;
    seekTo(Duration(
        seconds: value.toInt())); // Convert value to duration in seconds
  }

  void _setupAudioPlayer() {
    audioPlayer.onPositionChanged.listen((position) {
      if (!isDragging.value) {
        currentPosition.value =
            position; // Update current position unless dragging
      }
    });

    audioPlayer.onDurationChanged.listen((duration) {
      totalDuration.value = duration; // Update total duration
    });

    audioPlayer.setVolume(volume.value); // Set initial volume
  }

  void setVolume(double volume) {
    this.volume.value = volume.clamp(0.0, 1.0); 
    audioPlayer.setVolume(this.volume.value);
  }

  void seekTo(Duration position) {
    audioPlayer.seek(position);
  }

  // Toggle play/pause
  void togglePlayPause() async {
    if (isPlaying.value) {
      await audioPlayer.pause();
    } else {
      await audioPlayer.play(UrlSource(link));
      audioPlayer.onDurationChanged.listen((duration) {
        if (totalDuration.value == Duration.zero) {
          totalDuration.value =
              duration;
        }
      });
    }

    // Update play/pause state
    isPlaying.value = !isPlaying.value;
  }

  // Fetch the queue (add the logic for it)
  void getQueue() async {
    User user = await storage.getData("user") as User;

    if (user.id == null) {
      Get.snackbar("Error", "Network error");
      return;
    }

    Response response = await audioRepo.getQueue(user.id!);
  }

  @override
  void onClose() {
    audioPlayer.dispose();
    super.onClose();
  }
}
