part of 'pet_timeline_application.dart';

@immutable
abstract class PetTimelineState {
  const PetTimelineState();
}

@immutable
class PetTimelineInitState extends PetTimelineState {
  const PetTimelineInitState();
}

@immutable
class PetTimelineLoadingState extends PetTimelineState {
  const PetTimelineLoadingState();
}

@immutable
class PetTimelineErrorState extends PetTimelineState {
  const PetTimelineErrorState();
}

@immutable
class PetTimelineSuccessState extends PetTimelineState with EquatableMixin {
  final List<Pet> petList;
  final bool isLoadingPetList;
  final bool isLoadingMorePetList;
  final PetTimelineParam petTimelineParam;

  const PetTimelineSuccessState({
    required this.petList,
    required this.isLoadingPetList,
    required this.isLoadingMorePetList,
    required this.petTimelineParam,
  });

  @override
  List<Object?> get props => [
        petList,
        isLoadingPetList,
        isLoadingMorePetList,
        petTimelineParam,
      ];

  PetTimelineSuccessState copyWith({
    List<Pet>? petList,
    bool? isLoadingPetList,
    bool? isLoadingMorePetList,
    PetTimelineParam? petTimelineParam,
  }) {
    return PetTimelineSuccessState(
      petList: petList ?? this.petList,
      isLoadingPetList: isLoadingPetList ?? this.isLoadingPetList,
      isLoadingMorePetList: isLoadingMorePetList ?? this.isLoadingMorePetList,
      petTimelineParam: petTimelineParam ?? this.petTimelineParam,
    );
  }
}
