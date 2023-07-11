import 'package:flutter/material.dart';
import 'package:pets_carentes_app/index.dart';
import 'package:shimmer/shimmer.dart';

class SpecieTitleSelectWidget extends StatelessWidget {
  static Color shimmerLoaderBackground = Colors.grey.shade300;
  static Color shimmerLoaderForeground = Colors.white;

  final bool isHidden;
  final bool isLoading;
  final List<Specie> speciesSelected;

  const SpecieTitleSelectWidget({
    super.key,
    required this.isHidden,
    required this.isLoading,
    required this.speciesSelected,
  });

  String getTextFromSpecie({required List<Specie> species}) {
    if (species.length == 1 && species.first == Specie.dog) {
      return 'Cachorros...';
    }

    if (species.length == 1 && species.first == Specie.cat) {
      return 'Gatos...';
    }

    if (species.length == 1 && species.first == Specie.canary) {
      return 'Canários...';
    }

    if (species.length == 1 && species.first == Specie.pigIndian) {
      return 'Porquinhos da Índia...';
    }

    return 'Todos os tipos de pets...';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  // margin: const EdgeInsets.only(
                  //   bottom: SpacingParam.s4,
                  // ),
                  decoration: BoxDecoration(
                    color: shimmerLoaderBackground,
                    borderRadius: BorderRadius.circular(SpacingParam.s5),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return SliverAppBar(
      pinned: true,
      floating: true,
      stretch: true,
      forceElevated: true,
      elevation: 4,
      expandedHeight: 40.0,
      toolbarHeight: 40,
      collapsedHeight: 40,
      leadingWidth: 40,
      automaticallyImplyLeading: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(SpacingParam.s5),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          getTextFromSpecie(species: speciesSelected),
          style: theme.textTheme.headline6?.copyWith(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        titlePadding: const EdgeInsets.only(
          bottom: SpacingParam.s4,
          top: SpacingParam.s4,
        ),
      ),
    );
  }
}
