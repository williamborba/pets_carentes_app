import 'package:equatable/equatable.dart';
import 'package:pets_carentes_app/modules/pet/index.dart';

class Location extends Equatable {
  final String type;
  final Coordinates coordinates;

  const Location({
    required this.type,
    required this.coordinates,
  });

  @override
  List<Object?> get props => [
        type,
        coordinates,
      ];

  Location copyWith({
    String? type,
    Coordinates? coordinates,
  }) =>
      Location(
        type: type ?? this.type,
        coordinates: coordinates ?? this.coordinates,
      );
}
