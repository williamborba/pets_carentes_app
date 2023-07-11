import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pets_carentes_app/index.dart';

class PetTimelineParam extends Equatable {
  static const double latitudeDefault = 0.0;
  static const double longitudeDefault = 0.0;
  static const int meterDefault = 5000;
  static const int offsetDefault = 1;
  static const int limitDefault = 10;
  static const int meter1km = 1000;
  static const int meter3km = 3000;
  static const int meter5km = 5000;
  static const int meter15km = 15000;
  static const int meter100km = 100000;

  final List<Specie> species;
  final Coordinates coordinates;
  final bool orderDatePublish;
  final int meter;
  final int offset;
  final int limit;

  const PetTimelineParam({
    required this.species,
    required this.coordinates,
    required this.orderDatePublish,
    required this.meter,
    required this.offset,
    required this.limit,
  });

  @override
  List<Object> get props => [
        species,
        coordinates,
        orderDatePublish,
        meter,
        offset,
        limit,
      ];

  bool isOffsetDefault() => offset == offsetDefault;

  bool isOffsetPagination() => offset > offsetDefault;

  PetTimelineParam copyWith({
    List<Specie>? species,
    Coordinates? coordinates,
    bool? orderDatePublish,
    int? meter,
    int? offset,
    int? limit,
  }) {
    return PetTimelineParam(
      species: species ?? this.species,
      coordinates: coordinates ?? this.coordinates,
      orderDatePublish: orderDatePublish ?? this.orderDatePublish,
      meter: meter ?? this.meter,
      offset: offset ?? this.offset,
      limit: limit ?? this.limit,
    );
  }

  factory PetTimelineParam.pre() => const PetTimelineParam(
        species: Specie.values,
        coordinates: Coordinates(
          latitude: latitudeDefault,
          longitude: longitudeDefault,
        ),
        orderDatePublish: true,
        meter: meterDefault,
        offset: offsetDefault,
        limit: limitDefault,
      );

  factory PetTimelineParam.fromHttpGetParams({
    required String specie,
    required String latitude,
    required String longitude,
    required String orderDatePublish,
    required String meter,
    required String offset,
    required String limit,
  }) {
    return PetTimelineParam(
      species: specie.split(',').map((specie) => Specie.values[int.parse(specie)]).toList(),
      coordinates: Coordinates(
        latitude: double.parse(latitude),
        longitude: double.parse(longitude),
      ),
      orderDatePublish: orderDatePublish == 'true',
      meter: int.parse(meter),
      offset: int.parse(offset),
      limit: int.parse(limit),
    );
  }

  Map<String, dynamic> toQueryParams() {
    return {
      'specie': species.map((specie) => specie.index + 1).join(','),
      'latitude': coordinates.latitude.toString(),
      'longitude': coordinates.longitude.toString(),
      'order_date_publish': orderDatePublish.toString(),
      'meter': meter.toString(),
      'offset': offset.toString(),
      'limit': limit.toString(),
    };
  }

  static List<Tuple2<String, int>> toDistanceOptions() => [
        const Tuple2<String, int>('1km', meter1km),
        const Tuple2<String, int>('3km', meter3km),
        const Tuple2<String, int>('5km', meter5km),
        const Tuple2<String, int>('15km', meter15km),
        const Tuple2<String, int>('100km', meter100km),
      ];

  static List<Tuple2<Specie, String>> toSpecieOptions() => [
        const Tuple2(Specie.dog, 'lib/asset/images/dog.webp'),
        const Tuple2(Specie.cat, 'lib/asset/images/cat.webp'),
        const Tuple2(Specie.canary, 'lib/asset/images/canary.webp'),
        const Tuple2(Specie.pigIndian, 'lib/asset/images/pig_indian.webp'),
        const Tuple2(Specie.rabbit, 'lib/asset/images/pig_indian.webp'),
        const Tuple2(Specie.fish, 'lib/asset/images/pig_indian.webp'),
        const Tuple2(Specie.hamster, 'lib/asset/images/pig_indian.webp'),
      ];
}
