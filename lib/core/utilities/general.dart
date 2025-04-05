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
