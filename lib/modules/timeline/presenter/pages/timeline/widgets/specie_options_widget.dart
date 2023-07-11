import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:pets_carentes_app/index.dart';
import 'package:shimmer/shimmer.dart';

class SpecieOptionsWidget extends StatelessWidget {
  static Color shimmerLoaderBackground = Colors.grey.shade300;
  static Color shimmerLoaderForeground = Colors.white;

  final bool isHidden;
  final bool isLoading;
  final bool isBlocked;
  final List<Specie> speciesSelected;
  final List<Tuple2<Specie, String>> speciesOptions;
  final Function(List<Specie> species) onTap;

  const SpecieOptionsWidget({
    super.key,
    required this.isHidden,
    required this.isLoading,
    required this.isBlocked,
    required this.speciesSelected,
    required this.speciesOptions,
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
              children: [
                Expanded(
                  child: Container(
                    height: 120,
                    margin: const EdgeInsets.only(
                      right: SpacingParam.s2,
                    ),
                    decoration: BoxDecoration(
                      color: shimmerLoaderBackground,
                      borderRadius: BorderRadius.circular(SpacingParam.s5),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 120,
                    margin: const EdgeInsets.only(
                      right: SpacingParam.s2,
                    ),
                    decoration: BoxDecoration(
                      color: shimmerLoaderBackground,
                      borderRadius: BorderRadius.circular(SpacingParam.s5),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 120,
                    margin: const EdgeInsets.only(
                      right: SpacingParam.s2,
                    ),
                    decoration: BoxDecoration(
                      color: shimmerLoaderBackground,
                      borderRadius: BorderRadius.circular(SpacingParam.s5),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 120,
                    margin: const EdgeInsets.only(
                      right: SpacingParam.s2,
                    ),
                    decoration: BoxDecoration(
                      color: shimmerLoaderBackground,
                      borderRadius: BorderRadius.circular(SpacingParam.s5),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return SliverList(
      delegate: SliverChildListDelegate(
        [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: SpacingParam.s4,
              ),
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: speciesOptions
                      .map(
                        (Tuple2<Specie, String> specieOption) => GestureDetector(
                          onTap: () => isBlocked
                              ? null
                              : speciesSelected.length == 1 && speciesSelected.first == specieOption.value1
                                  ? onTap(Specie.values)
                                  : onTap([specieOption.value1]),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              right: SpacingParam.s4,
                            ),
                            child: Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(specieOption.value2),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(SpacingParam.s5),
                                border: speciesSelected.length == 1 && speciesSelected.first == specieOption.value1
                                    ? Border.all(
                                        width: SpacingParam.s2,
                                        color: CoreTheme.colorMainAccent,
                                      )
                                    : null,
                                boxShadow: const [
                                  BoxShadow(
                                    offset: Offset(2, 2),
                                    spreadRadius: 0,
                                    blurRadius: 2,
                                    color: Color.fromRGBO(0, 0, 0, 0.4), // changes position of shadow
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
