import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'pet_state.dart';

class PetApplication extends Cubit<PetState> {
  PetApplication() : super(const PetLoadingState());
}
