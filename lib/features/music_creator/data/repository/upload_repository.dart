import 'dart:io';

abstract class MusicUpload {
  Future<bool> uploadMusic(File file);
}
