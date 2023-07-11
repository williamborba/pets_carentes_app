import 'package:dartz/dartz.dart';
import 'package:pets_carentes_app/index.dart';

abstract class PetService {
  Future<Either<CoreFailure, List<Pet>>> getPetTimeline({
    required PetTimelineParam petTimelineParam,
  });
}
