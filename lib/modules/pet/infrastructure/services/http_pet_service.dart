import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:pets_carentes_app/index.dart';

class HttpPetService implements PetService {
  @override
  Future<Either<CoreFailure, List<Pet>>> getPetTimeline({
    required PetTimelineParam petTimelineParam,
  }) async {
    try {
      Uri uri = Uri.http(
        hostApi,
        '$pathBaseApi/pet/timeline',
        petTimelineParam.toQueryParams(),
      );

      print('########################################');
      print(petTimelineParam.toQueryParams());
      print('########################################');

      Response response = await get(
        uri,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'x-api-key': apiKeyHeader,
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyLnVzZXJfaWQiOiI2M2Y3NjUxNmNjNjk4NGEyMzk5YmExYTEifQ.3GENJFhvXVbgfunecKFbiXOOSssJr1u73kVEANY2rss',
        },
      );

      List<Pet> pets =
          PetDto.fromBodyBytes(bodyBytes: response.bodyBytes).map((PetDto petDto) => petDto.toEntity()).toList();

      return Right(pets);
    } on Exception catch (error) {
      ConsoleLog().log(message: error.toString(), exception: error);

      return Left(PetTimelineFailure('Error to get pet timeline'));
    }
  }
}
