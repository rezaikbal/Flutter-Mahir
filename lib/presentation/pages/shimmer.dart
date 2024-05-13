import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget showShimmer() {
  return SizedBox(
    height: 170,
    width: 120,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 8,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
            child: Skeleton(height: 170, width: 120),
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!);
      },
    ),
  );
}

class Skeleton extends StatelessWidget {
  const Skeleton({Key? key, this.height, this.width}) : super(key: key);

  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.04),
          borderRadius: const BorderRadius.all(Radius.circular(16))),
    );
  }
}
