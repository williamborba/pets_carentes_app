import 'package:equatable/equatable.dart';
import 'package:pets_carentes_app/modules/pet/index.dart';

class LocationDto extends Equatable {
  final String type;
  final CoordinatesDto coordinates;

  const LocationDto({
    required this.type,
    required this.coordinates,
  });

  @override
  List<Object?> get props => [
        type,
        coordinates,
      ];

  factory LocationDto.fromEntity({required Location location}) => LocationDto(
        type: location.type,
        coordinates: CoordinatesDto.fromEntity(coordinates: location.coordinates),
      );

  factory LocationDto.fromJson({required Map<String, dynamic> json}) => LocationDto(
        type: json['type'],
        coordinates: CoordinatesDto.fromJson(json: json['coordinates']),
      );

  Location toEntity() => Location(
        type: type,
        coordinates: coordinates.toEntity(),
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'coordinates': coordinates.toJson(),
      };
}
