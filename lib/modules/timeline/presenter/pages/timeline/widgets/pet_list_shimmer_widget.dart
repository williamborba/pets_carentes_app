import 'package:flutter/material.dart';
import 'package:pets_carentes_app/index.dart';
import 'package:shimmer/shimmer.dart';

class PetListShimmerWidget extends StatelessWidget {
  static Color shimmerLoaderBackground = Colors.grey.shade300;
  static Color shimmerLoaderForeground = Colors.white;

  const PetListShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(
        top: SpacingParam.s4,
      ),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 250.0,
          mainAxisSpacing: SpacingParam.s4,
          crossAxisSpacing: SpacingParam.s4,
          childAspectRatio: 1,
        ),
        delegate: SliverChildBuilderDelegate(
          childCount: 10,
          (BuildContext context, int index) {
            return Shimmer.fromColors(
              baseColor: shimmerLoaderBackground,
              highlightColor: shimmerLoaderForeground,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: shimmerLoaderBackground,
                        borderRadius: BorderRadius.circular(SpacingParam.s5),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: shimmerLoaderBackground,
                          borderRadius: BorderRadius.circular(SpacingParam.s5),
                        ),
                        height: 20,
                      ),
                      const SizedBox(
                        height: SpacingParam.s2,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: shimmerLoaderBackground,
                              borderRadius: BorderRadius.circular(SpacingParam.s5),
                            ),
                            width: 80,
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: shimmerLoaderBackground,
                              borderRadius: BorderRadius.circular(SpacingParam.s5),
                            ),
                            width: 50,
                            height: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
