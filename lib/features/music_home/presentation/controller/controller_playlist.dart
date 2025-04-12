import 'package:get/get.dart';
import 'package:meowdify/features/music_home/domain/entities/playlist.dart';

// TODO list detail page
class PlaylistController extends GetxController {
  final String playlistId;

  var playlist = Playlist();

  PlaylistController(this.playlistId);
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
