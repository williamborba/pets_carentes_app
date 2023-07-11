import 'package:flutter/material.dart';
import 'package:pets_carentes_app/index.dart';
import 'package:shimmer/shimmer.dart';

class AppBarShimmerWidget extends StatelessWidget {
  static Color shimmerLoaderBackground = Colors.grey.shade300;
  static Color shimmerLoaderForeground = Colors.white;

  const AppBarShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: shimmerLoaderBackground,
      highlightColor: shimmerLoaderForeground,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 200,
            height: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(SpacingParam.s5),
              color: shimmerLoaderBackground,
            ),
          ),
          const SizedBox(height: 5),
          Container(
            width: 120,
            height: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(SpacingParam.s5),
              color: shimmerLoaderBackground,
            ),
          ),
        ],
      ),
    );
  }
}
