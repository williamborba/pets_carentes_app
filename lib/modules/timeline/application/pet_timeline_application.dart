import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pets_carentes_app/index.dart';

part 'pet_timeline_state.dart';

class PetTimelineApplication extends Cubit<PetTimelineState> {
  final PetService petService;

  PetTimelineApplication({
    required this.petService,
  }) : super(const PetTimelineInitState());

  PetTimelineParam get getPetTimelineParam => state is PetTimelineSuccessState
      ? PetTimelineParam.pre().copyWith(
          species: (state as PetTimelineSuccessState).petTimelineParam.species,
          coordinates: (state as PetTimelineSuccessState).petTimelineParam.coordinates,
          meter: (state as PetTimelineSuccessState).petTimelineParam.meter,
          offset: (state as PetTimelineSuccessState).petTimelineParam.offset,
        )
      : PetTimelineParam.pre();

  Future<void> getPetTimeline({
    required PetTimelineParam petTimelineParam,
  }) async {
    emit(
      PetTimelineSuccessState(
        petList: state is! PetTimelineSuccessState ? const [] : (state as PetTimelineSuccessState).petList,
        petTimelineParam: petTimelineParam,
        isLoadingPetList: state is! PetTimelineSuccessState
            ? true
            : petTimelineParam.isOffsetPagination()
                ? false
                : true,
        isLoadingMorePetList: state is! PetTimelineSuccessState
            ? false
            : petTimelineParam.isOffsetPagination()
                ? true
                : false,
      ),
    );

    // TODO: Remove this delay
    await Future.delayed(
      const Duration(milliseconds: 3000),
    );

    final Either<CoreFailure, List<Pet>> petTimeline = await petService.getPetTimeline(
      petTimelineParam: petTimelineParam,
    );

    petTimeline.fold(
      (CoreFailure failure) => emit(const PetTimelineErrorState()),
      (List<Pet> petList) {
        final stateCurrent = state as PetTimelineSuccessState;

        emit(
          stateCurrent.copyWith(
            petList: petTimelineParam.isOffsetDefault() ? petList : stateCurrent.petList + petList,
            isLoadingPetList: false,
            isLoadingMorePetList: false,
            petTimelineParam: petTimelineParam.copyWith(
              offset: petTimelineParam.isOffsetDefault()
                  ? null
                  : petList.isEmpty
                      ? petTimelineParam.offset - 1
                      : null,
            ),
          ),
        );
      },
    );
  }

  Future<void> getPetTimelinePagination() async {
    if (state is! PetTimelineSuccessState) return;
    if ((state as PetTimelineSuccessState).isLoadingPetList) return;
    if ((state as PetTimelineSuccessState).isLoadingMorePetList) return;

    await getPetTimeline(
      petTimelineParam: getPetTimelineParam.copyWith(
        offset: getPetTimelineParam.offset + 1,
      ),
    );
  }

  Future<void> onRefreshPage({
    required Function refreshPage,
  }) async {
    if (state is! PetTimelineSuccessState) return;
    if ((state as PetTimelineSuccessState).isLoadingPetList) return;
    if ((state as PetTimelineSuccessState).isLoadingMorePetList) return;

    refreshPage();
  }

  Future<void> onTapSpecieOptionsWidget({
    required List<Specie> species,
  }) async {
    if (state is! PetTimelineSuccessState) return;
    if ((state as PetTimelineSuccessState).isLoadingPetList) return;
    if ((state as PetTimelineSuccessState).isLoadingMorePetList) return;

    getPetTimeline(
      petTimelineParam: getPetTimelineParam.copyWith(
        offset: PetTimelineParam.offsetDefault,
        species: species,
      ),
    );
  }

  Future<void> onTapDistanceOptionsWidget({
    required int distance,
  }) async {
    if (state is! PetTimelineSuccessState) return;
    if ((state as PetTimelineSuccessState).isLoadingPetList) return;
    if ((state as PetTimelineSuccessState).isLoadingMorePetList) return;

    getPetTimeline(
      petTimelineParam: getPetTimelineParam.copyWith(
        offset: PetTimelineParam.offsetDefault,
        meter: distance,
      ),
    );
  }

  bool isProgressBarPagination() {
    if (state is! PetTimelineSuccessState) return false;
    if ((state as PetTimelineSuccessState).isLoadingPetList) return false;
    if ((state as PetTimelineSuccessState).isLoadingMorePetList) return true;
    return false;
  }

  bool isHidden() {
    if (state is PetTimelineInitState) return true;
    if (state is PetTimelineErrorState) return true;
    return false;
  }

  bool isLoading() {
    if (state is PetTimelineErrorState) return false;
    if (state is! PetTimelineSuccessState) return true;
    return false;
  }

  bool isBlocked() {
    if (state is! PetTimelineSuccessState) return true;
    if ((state as PetTimelineSuccessState).isLoadingPetList) return true;
    if ((state as PetTimelineSuccessState).isLoadingMorePetList) return true;
    return false;
  }
}
