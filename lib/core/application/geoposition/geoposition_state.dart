part of 'geoposition_application.dart';

@immutable
class GeoPositionState {
  const GeoPositionState();
}

@immutable
class GeoPositionInitState extends GeoPositionState {
  const GeoPositionInitState();
}

@immutable
class GeoPositionLoadingState extends GeoPositionState {
  const GeoPositionLoadingState();
}

@immutable
class GeoPositionErrorState extends GeoPositionState {
  const GeoPositionErrorState();
}

@immutable
class GeoPositionSuccessState extends GeoPositionState with EquatableMixin {
  final double latitude;
  final double longitude;
  final String isoCountryCode;
  final String subAdministrativeArea;
  final String street;

  const GeoPositionSuccessState({
    required this.latitude,
    required this.longitude,
    required this.isoCountryCode,
    required this.subAdministrativeArea,
    required this.street,
  });

  @override
  List<Object?> get props => [
        latitude,
        longitude,
        isoCountryCode,
        subAdministrativeArea,
        street,
      ];
}
