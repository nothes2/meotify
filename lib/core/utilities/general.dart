import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MeoShimmer extends StatelessWidget {
  const MeoShimmer({super.key, this.hight, this.width});
  final double? hight;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          width: width,
          height: hight,
          color: Colors.white,
        ));
  }
}

Future<PlatformFile> pickSingleFile() async {
  final result = await FilePicker.platform.pickFiles();

  if (result != null && result.files.isNotEmpty) {
    return result.files.first;
  }

  return PlatformFile(name: "empty", size: 0);
}
