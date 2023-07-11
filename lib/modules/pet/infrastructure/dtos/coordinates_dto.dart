import 'package:equatable/equatable.dart';
import 'package:pets_carentes_app/modules/pet/index.dart';

class CoordinatesDto extends Equatable {
  final double longitude;
  final double latitude;

  const CoordinatesDto({
    required this.longitude,
    required this.latitude,
  });

  @override
  List<Object?> get props => [
        longitude,
        latitude,
      ];

  factory CoordinatesDto.fromEntity({required Coordinates coordinates}) => CoordinatesDto(
        longitude: coordinates.longitude,
        latitude: coordinates.latitude,
      );

  factory CoordinatesDto.fromJson({required Map<String, dynamic> json}) => CoordinatesDto(
        longitude: json['longitude'],
        latitude: json['latitude'],
      );

  Coordinates toEntity() => Coordinates(
        longitude: longitude,
        latitude: latitude,
      );

  Map<String, dynamic> toJson() => {
        'longitude': longitude,
        'latitude': latitude,
      };
}
