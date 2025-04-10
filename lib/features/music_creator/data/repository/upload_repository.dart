import 'dart:io';

import 'package:get/get.dart';

abstract class MusicUpload {
  Future<Response?> uploadMusic(File file);
}
