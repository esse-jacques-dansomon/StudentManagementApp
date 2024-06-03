import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  final double height;
  final double? width;
  final double? padding;
  const CustomShimmer({super.key, this.width, required this.height, this.padding});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: width != null ? Container(
        height: height,
        width: width,
        color: Colors.white,
        padding:  EdgeInsets.all(padding ?? 0),

      ) : Container(
        padding:  EdgeInsets.all(padding ?? 0),
        height: height,
        color: Colors.white,
      ),
    );
  }
}
