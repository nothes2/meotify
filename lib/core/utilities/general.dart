import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/response/response.dart';
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

Future<PlatformFile?> pickSingleFile(FileType type) async {
  final result = await FilePicker.platform.pickFiles(type: type);

  if (result != null && result.files.isNotEmpty) {
    return result.files.first;
  }

  return null;
}

Response errorCheck(String label, Response response) {
  if (response.isOk) {
    return response;
  } else {
    throw Exception('Failed to $label: ${response.statusText}');
  }
}

Text secondaryTitleText(String text) {
  return Text(
    text,
    style: const TextStyle(fontSize: 16),
  );
}

Text titleText(String text) {
  return Text(
    text,
    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  );
}
