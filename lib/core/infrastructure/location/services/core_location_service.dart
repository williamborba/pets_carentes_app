import 'package:dartz/dartz.dart';
import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart' as loc;
import 'package:pets_carentes_app/core/infrastructure/location/failures/index.dart';

class CoreLocationService {
  Future<Either<LocationFailure, loc.LocationData>> getLocation() async {
    final loc.Location location = loc.Location();

    if (!(await location.serviceEnabled())) {
      if (!(await location.requestService())) {
        return Left(
          LocationFailure('Location service is disabled'),
        );
      }
    }

    if ((await location.hasPermission()) == loc.PermissionStatus.denied) {
      if ((await location.requestPermission()) != loc.PermissionStatus.granted) {
        return Left(
          LocationFailure('Location permission is denied'),
        );
      }
    }

    return Right(
      await location.getLocation(),
    );
  }

  Future<Either<PlaceMarkFailure, Placemark>> getPlaceMarkFromCoordinates({
    required double latitude,
    required double longitude,
  }) async {
    try {
      final List<Placemark> placeMarkList = await placemarkFromCoordinates(
        latitude,
        longitude,
      );

      return Right(
        placeMarkList.first,
      );
    } catch (error) {
      return Left(
        PlaceMarkFailure('Error getting place mark from coordinates'),
      );
    }
  }
}
