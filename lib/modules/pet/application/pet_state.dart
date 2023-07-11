part of 'pet_application.dart';

@immutable
abstract class PetState {
  const PetState();
}

@immutable
class PetInitState extends PetState {
  const PetInitState();
}

@immutable
class PetLoadingState extends PetState {
  const PetLoadingState();
}

@immutable
class PetErrorState extends PetState {
  const PetErrorState();
}

@immutable
class PetSuccessState extends PetState with EquatableMixin {
  const PetSuccessState();

  @override
  List<Object?> get props => [];
}
