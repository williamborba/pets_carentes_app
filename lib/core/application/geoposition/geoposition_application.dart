import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart';
import 'package:meta/meta.dart';
import 'package:pets_carentes_app/index.dart';

part 'geoposition_state.dart';

class GeoPositionApplication extends Cubit<GeoPositionState> {
  final CoreLocationService coreLocationService;

  GeoPositionApplication({
    required this.coreLocationService,
  }) : super(const GeoPositionLoadingState());

  Future<void> getGeoPosition({Function? onCompleteGeoPosition}) async {
    emit(const GeoPositionLoadingState());

    final Either<LocationFailure, LocationData> locationService = await coreLocationService.getLocation();

    locationService.fold(
      (LocationFailure failure) => emit(const GeoPositionErrorState()),
      (LocationData location) async {
        Either<PlaceMarkFailure, Placemark> placeMarkService = await coreLocationService.getPlaceMarkFromCoordinates(
          latitude: location.latitude ?? 0,
          longitude: location.longitude ?? 0,
        );

        placeMarkService.fold(
          (PlaceMarkFailure failure) => emit(const GeoPositionErrorState()),
          (Placemark placeMark) {
            emit(
              GeoPositionSuccessState(
                latitude: location.latitude ?? 0,
                longitude: location.longitude ?? 0,
                isoCountryCode: placeMark.isoCountryCode ?? '',
                subAdministrativeArea: placeMark.subAdministrativeArea ?? '',
                street: placeMark.street ?? '',
              ),
            );

            onCompleteGeoPosition != null ? onCompleteGeoPosition() : () => false;
          },
        );
      },
    );
  }

  Coordinates get coordinates => state is GeoPositionSuccessState
      ? Coordinates(
          latitude: (state as GeoPositionSuccessState).latitude,
          longitude: (state as GeoPositionSuccessState).longitude,
        )
      : const Coordinates(latitude: 0, longitude: 0);
}
