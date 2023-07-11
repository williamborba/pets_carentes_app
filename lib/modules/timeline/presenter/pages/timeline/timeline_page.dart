import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pets_carentes_app/index.dart';

class TimelinePage extends StatelessWidget {
  const TimelinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GeoPositionApplication>(
          create: (BuildContext context) => GeoPositionApplication(
            coreLocationService: Get.find<CoreLocationService>(),
          ),
        ),
        BlocProvider<PetTimelineApplication>(
          create: (BuildContext context) => PetTimelineApplication(
            petService: Get.find<PetService>(),
          ),
        ),
      ],
      child: const TimelinePageContent(),
    );
  }
}

class TimelinePageContent extends StatefulWidget {
  const TimelinePageContent({super.key});

  @override
  State<TimelinePageContent> createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePageContent> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    context.read<GeoPositionApplication>().getGeoPosition(
          onCompleteGeoPosition: () => context.read<PetTimelineApplication>().getPetTimeline(
                petTimelineParam: context.read<PetTimelineApplication>().getPetTimelineParam.copyWith(
                      coordinates: context.read<GeoPositionApplication>().coordinates,
                      offset: PetTimelineParam.offsetDefault,
                    ),
              ),
        );

    scrollController.addListener(() {
      if (scrollController.position.pixels != scrollController.position.minScrollExtent &&
          scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        context.read<PetTimelineApplication>().getPetTimelinePagination();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: BlocBuilder<GeoPositionApplication, GeoPositionState>(
          builder: (BuildContext context, GeoPositionState state) {
            return AppBarWidget(
              isLoading: state is GeoPositionLoadingState ? true : false,
              isError: state is GeoPositionErrorState ? true : false,
              city: state is GeoPositionSuccessState ? state.subAdministrativeArea : null,
              countryCode: state is GeoPositionSuccessState ? state.isoCountryCode : null,
              street: state is GeoPositionSuccessState ? state.street : null,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => true,
        backgroundColor: CoreTheme.colorMainAccent,
        child: const Icon(
          FontAwesomeIcons.plus,
          color: CoreTheme.colorMainIcon,
          size: 20,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      body: Padding(
        padding: const EdgeInsets.all(
          SpacingParam.s4,
        ),
        child: BlocBuilder<PetTimelineApplication, PetTimelineState>(
          builder: (BuildContext context, PetTimelineState state) {
            return CustomRefreshIndicator(
              builder: MaterialIndicatorDelegate(
                builder: (context, controller) {
                  return const Icon(
                    FontAwesomeIcons.paw,
                    color: CoreTheme.colorMain,
                    size: 30,
                  );
                },
              ),
              triggerMode: IndicatorTriggerMode.anywhere,
              onRefresh: () async => context.read<PetTimelineApplication>().onRefreshPage(
                    refreshPage: () => context.read<GeoPositionApplication>().getGeoPosition(
                          onCompleteGeoPosition: () => context.read<PetTimelineApplication>().getPetTimeline(
                                petTimelineParam: context.read<PetTimelineApplication>().getPetTimelineParam.copyWith(
                                      offset: PetTimelineParam.offsetDefault,
                                    ),
                              ),
                        ),
                  ),
              child: CustomScrollView(
                controller: scrollController,
                scrollDirection: Axis.vertical,
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  SpecieOptionsWidget(
                    isHidden: context.read<PetTimelineApplication>().isHidden(),
                    isLoading: context.read<PetTimelineApplication>().isLoading(),
                    isBlocked: context.read<PetTimelineApplication>().isBlocked(),
                    speciesSelected: state is PetTimelineSuccessState ? state.petTimelineParam.species : Specie.values,
                    speciesOptions: PetTimelineParam.toSpecieOptions(),
                    onTap: (List<Specie> species) => context.read<PetTimelineApplication>().onTapSpecieOptionsWidget(
                          species: species,
                        ),
                  ),
                  // TODO: add onTap on distances
                  DistanceOptionsWidget(
                    isHidden: context.read<PetTimelineApplication>().isHidden(),
                    isLoading: context.read<PetTimelineApplication>().isLoading(),
                    isBlocked: context.read<PetTimelineApplication>().isBlocked(),
                    distanceOptions: PetTimelineParam.toDistanceOptions(),
                    distanceSelected:
                        state is PetTimelineSuccessState ? state.petTimelineParam.meter : PetTimelineParam.meterDefault,
                    onTap: (int distance) => context.read<PetTimelineApplication>().onTapDistanceOptionsWidget(
                          distance: distance,
                        ),
                  ),
                  SpecieTitleSelectWidget(
                    isHidden: context.read<PetTimelineApplication>().isHidden(),
                    isLoading: context.read<PetTimelineApplication>().isLoading(),
                    speciesSelected: state is PetTimelineSuccessState ? state.petTimelineParam.species : Specie.values,
                  ),
                  state is! PetTimelineSuccessState
                      ? TryAgainWidget(
                          isLoadingGeoPosition: state is PetTimelineInitState,
                          onPressed: () => context.read<GeoPositionApplication>().getGeoPosition().then(
                                (void _) => context.read<PetTimelineApplication>().getPetTimeline(
                                      petTimelineParam:
                                          context.read<PetTimelineApplication>().getPetTimelineParam.copyWith(
                                                offset: PetTimelineParam.offsetDefault,
                                              ),
                                    ),
                              ),
                        )
                      : state.isLoadingPetList
                          ? const PetListShimmerWidget()
                          : PetListWidget(petList: state.petList),
                  SliverToBoxAdapter(
                    child: !context.read<PetTimelineApplication>().isProgressBarPagination()
                        ? const SizedBox.shrink()
                        : const Padding(
                            padding: EdgeInsets.only(
                              top: SpacingParam.s4,
                              bottom: SpacingParam.s4,
                            ),
                            child: LinearProgressIndicator(),
                          ),
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
