import 'package:equatable/equatable.dart';

class Coordinates extends Equatable {
  final double longitude;
  final double latitude;

  const Coordinates({
    required this.longitude,
    required this.latitude,
  });

  @override
  List<Object?> get props => [
        longitude,
        latitude,
      ];

  Coordinates copyWith({
    double? longitude,
    double? latitude,
  }) =>
      Coordinates(
        longitude: longitude ?? this.longitude,
        latitude: latitude ?? this.latitude,
      );
}
