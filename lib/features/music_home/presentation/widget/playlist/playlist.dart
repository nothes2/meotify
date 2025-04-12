import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meowdify/features/music_home/presentation/controller/controller_playlist.dart';

// TODO get data from databsae and design the playlist style it should be double clicked play song, and some other features
class PlaylistPage extends StatelessWidget {
  final String playlistId;

  const PlaylistPage({super.key, required this.playlistId});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PlaylistController(playlistId));
    return Center(
      child: Text(playlistId),
    );
  }
}
