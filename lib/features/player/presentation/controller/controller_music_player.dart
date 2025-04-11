import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class AudioController extends GetxController {
  // The audio player instance
  late AudioPlayer _audioPlayer;

  // Observable variables for audio state
  var isPlaying = false.obs;
  var isLooping = false.obs;
  var currentPosition = Duration.zero.obs;
  var totalDuration = Duration.zero.obs;

  // Playlist
  final List<String> playlist = [
    "https://www.example.com/audio1.mp3",
    "https://www.example.com/audio2.mp3",
    "https://www.example.com/audio3.mp3",
  ];
  var currentTrackIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    _audioPlayer = AudioPlayer();
    _setupAudioPlayer();
  }

  // Set up the player
  void _setupAudioPlayer() {
    _audioPlayer.positionStream.listen((position) {
      currentPosition.value = position;
    });

    _audioPlayer.durationStream.listen((duration) {
      if (duration != null) {
        totalDuration.value = duration;
      }
    });

    _audioPlayer.playbackEventStream.listen((event) {
      if (event.processingState == ProcessingState.completed) {
        nextTrack();
      }
    });
  }

  // Play or pause the music
  void togglePlayPause() async {
    if (isPlaying.value) {
      await _audioPlayer.pause();
    } else {
      if (_audioPlayer.playerState.processingState == ProcessingState.completed) {
        await _audioPlayer.seek(Duration.zero);
      }
      await _audioPlayer.play();
    }
    isPlaying.value = !isPlaying.value;
  }

  // Play the current track
  void playTrack(int index) async {
    await _audioPlayer.setUrl(playlist[index]);
    await _audioPlayer.play();
    currentTrackIndex.value = index;
    isPlaying.value = true;
  }

  // Stop the audio
  void stopAudio() async {
    await _audioPlayer.stop();
    isPlaying.value = false;
  }

  // Enable or disable loop
  void toggleLoop() {
    isLooping.value = !isLooping.value;
    _audioPlayer.setLoopMode(isLooping.value ? LoopMode.all : LoopMode.off);
  }

  // Skip to the next track in the playlist
  void nextTrack() {
    if (currentTrackIndex.value < playlist.length - 1) {
      playTrack(currentTrackIndex.value + 1);
    } else {
      playTrack(0); // Loop back to the first track
    }
  }

  // Go to the previous track
  void previousTrack() {
    if (currentTrackIndex.value > 0) {
      playTrack(currentTrackIndex.value - 1);
    } else {
      playTrack(playlist.length - 1); // Loop back to the last track
    }
  }

  @override
  void onClose() {
    _audioPlayer.dispose();
    super.onClose();
  }
}
