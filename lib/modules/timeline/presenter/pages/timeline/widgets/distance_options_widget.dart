import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets_carentes_app/index.dart';
import 'package:shimmer/shimmer.dart';

class DistanceOptionsWidget extends StatelessWidget {
  static Color shimmerLoaderBackground = Colors.grey.shade300;
  static Color shimmerLoaderForeground = Colors.white;

  final bool isHidden;
  final bool isLoading;
  final bool isBlocked;
  final List<Tuple2<String, int>> distanceOptions;
  final int distanceSelected;
  final Function(int distance) onTap;

  const DistanceOptionsWidget({
    super.key,
    required this.isHidden,
    required this.isLoading,
    required this.isBlocked,
    required this.distanceOptions,
    required this.distanceSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (isHidden) {
      return const SliverToBoxAdapter(
        child: SizedBox.shrink(),
      );
    }

    if (isLoading) {
      return SliverToBoxAdapter(
        child: Shimmer.fromColors(
          baseColor: shimmerLoaderBackground,
          highlightColor: shimmerLoaderForeground,
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: SpacingParam.s4,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: distanceOptions
                  .map(
                    (Tuple2<String, int> distanceOption) => Expanded(
                      child: Container(
                        height: 50,
                        margin: EdgeInsets.only(
                          right: distanceOptions.last.value1 == distanceOption.value1 ? 0 : SpacingParam.s2,
                        ),
                        decoration: BoxDecoration(
                          color: shimmerLoaderBackground,
                          borderRadius: BorderRadius.circular(SpacingParam.s5),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      );
    }

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: SpacingParam.s4,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: distanceOptions
              .map(
                (Tuple2<String, int> distanceOption) => Expanded(
                  child: GestureDetector(
                    onTap: () => onTap(distanceOption.value2),
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(SpacingParam.s5),
                        side: BorderSide(
                          width: distanceSelected == distanceOption.value2 ? SpacingParam.s2 : 0,
                          color: distanceSelected == distanceOption.value2
                              ? CoreTheme.colorMainAccent
                              : Colors.transparent,
                        ),
                      ),
                      child: Container(
                        height: 50,
                        margin: EdgeInsets.only(
                          right: distanceOptions.last.value1 == distanceOption.value1 ? 0 : SpacingParam.s2,
                        ),
                        child: Center(
                          child: Text(
                            distanceOption.value1,
                            style: context.theme.textTheme.bodyText1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
