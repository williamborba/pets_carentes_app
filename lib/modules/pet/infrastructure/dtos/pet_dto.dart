import 'dart:convert';
import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:pets_carentes_app/modules/pet/index.dart';
import 'package:pets_carentes_app/modules/user/index.dart';

class PetDto extends Equatable {
  final String id;
  final LocationDto location;
  final Accept accept;
  final Specie specie;
  final Gender gender;
  final String breed;
  final int weight;
  final String content;
  final DateTime dateBirth;
  final DateTime dateCreate;
  final DateTime datePublish;
  final List<PhotoDto> photos;
  final PetStatus status;
  final UserDto userOriginId;
  final int hits;
  final int daysLeftExpired;
  final bool registerStatus;
  final DateTime? dateUpdate;
  final String? pageLink;
  final UserDto? userGuardId;
  final List<UserDto>? userCandidateIds;
  final List<String>? healthIds;
  final String? distanceCalculated;

  const PetDto({
    required this.id,
    required this.location,
    required this.accept,
    required this.specie,
    required this.gender,
    required this.breed,
    required this.weight,
    required this.content,
    required this.dateBirth,
    required this.dateCreate,
    required this.datePublish,
    required this.photos,
    required this.status,
    required this.userOriginId,
    required this.hits,
    required this.daysLeftExpired,
    required this.registerStatus,
    this.dateUpdate,
    this.pageLink,
    this.userGuardId,
    this.userCandidateIds,
    this.healthIds,
    this.distanceCalculated,
  });

  @override
  List<Object?> get props => [
        id,
        location,
        accept,
        specie,
        gender,
        breed,
        weight,
        content,
        dateBirth,
        dateCreate,
        dateUpdate,
        datePublish,
        pageLink,
        photos,
        status,
        userOriginId,
        userGuardId,
        userCandidateIds,
        healthIds,
        hits,
        daysLeftExpired,
        registerStatus,
        distanceCalculated,
      ];

  factory PetDto.fromEntity({required Pet pet}) => PetDto(
        id: pet.id,
        location: LocationDto.fromEntity(location: pet.location),
        accept: pet.accept,
        specie: pet.specie,
        gender: pet.gender,
        breed: pet.breed,
        weight: pet.weight,
        content: pet.content,
        dateBirth: pet.dateBirth,
        dateCreate: pet.dateCreate,
        dateUpdate: pet.dateUpdate,
        datePublish: pet.datePublish,
        pageLink: pet.pageLink,
        photos: pet.photos.map((Photo photo) => PhotoDto.fromEntity(photo: photo)).toList(),
        status: pet.status,
        userOriginId: UserDto.fromEntity(user: pet.userOriginId),
        userGuardId: pet.userGuardId != null ? UserDto.fromEntity(user: pet.userGuardId!) : null,
        userCandidateIds: pet.userCandidateIds != null
            ? pet.userCandidateIds?.map((User user) => UserDto.fromEntity(user: user)).toList() ?? []
            : null,
        healthIds: pet.healthIds,
        hits: pet.hits,
        daysLeftExpired: pet.daysLeftExpired,
        distanceCalculated: pet.distanceCalculated,
        registerStatus: pet.registerStatus,
      );

  factory PetDto.fromJson({required Map<String, dynamic> json}) => PetDto(
        id: json['_id'],
        location: LocationDto.fromJson(json: json['location']),
        accept: Accept.values[json['accept'] - 1],
        specie: Specie.values[json['specie'] - 1],
        gender: Gender.values[json['gender'] - 1],
        breed: json['breed'],
        weight: json['weight'],
        content: json['content'],
        dateBirth: DateTime.parse(json['date_birth']),
        dateCreate: DateTime.parse(json['date_create']),
        dateUpdate: json['date_update'] != null ? DateTime.parse(json['date_update']) : null,
        datePublish: DateTime.parse(json['date_publish']),
        pageLink: json['page_link'],
        photos: (json['photos'] as List<dynamic>)
            .map((dynamic photo) => PhotoDto.fromJson(json: Map<String, dynamic>.from(photo)))
            .toList(),
        status: PetStatus.values[json['status'] - 1],
        userOriginId: UserDto.fromJson(json: json['user_origin_id']),
        userGuardId: json['user_guard_id'] != null ? UserDto.fromJson(json: json['user_guard_id']) : null,
        userCandidateIds: json['user_candidate_ids'] != null
            ? (json['user_candidate_ids'] as List<dynamic>)
                .map((dynamic user) => UserDto.fromJson(json: Map<String, dynamic>.from(user)))
                .toList()
            : null,
        healthIds: json['health_ids'] != null ? List<String>.from(json['health_ids']) : null,
        hits: json['hits'],
        daysLeftExpired: json['days_left_expired'],
        distanceCalculated: json['distance_calculated'],
        registerStatus: json['register_status'],
      );

  static List<PetDto> fromBodyBytes({required Uint8List bodyBytes}) {
    final List<dynamic> bodyList = json.decode(utf8.decode(bodyBytes)).toList();

    return bodyList.map((dynamic json) => PetDto.fromJson(json: Map<String, dynamic>.from(json))).toList();
  }

  Pet toEntity() => Pet(
        id: id,
        location: location.toEntity(),
        accept: accept,
        specie: specie,
        gender: gender,
        breed: breed,
        weight: weight,
        content: content,
        dateBirth: dateBirth,
        dateCreate: dateCreate,
        dateUpdate: dateUpdate,
        datePublish: datePublish,
        pageLink: pageLink,
        photos: photos.map((PhotoDto photo) => photo.toEntity()).toList(),
        status: status,
        userOriginId: userOriginId.toEntity(),
        userGuardId: userGuardId != null ? userGuardId!.toEntity() : null,
        userCandidateIds:
            userCandidateIds != null ? userCandidateIds!.map((UserDto user) => user.toEntity()).toList() : null,
        healthIds: healthIds,
        hits: hits,
        daysLeftExpired: daysLeftExpired,
        distanceCalculated: distanceCalculated,
        registerStatus: registerStatus,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "location": location.toJson(),
        "accept": Accept.values[accept.index],
        "specie": Specie.values[specie.index],
        "gender": Gender.values[gender.index],
        "breed": breed,
        "weight": weight,
        "content": content,
        "date_birth": dateBirth.toIso8601String(),
        "date_create": dateCreate.toIso8601String(),
        "date_update": dateUpdate?.toIso8601String(),
        "date_publish": datePublish.toIso8601String(),
        "page_link": pageLink,
        "photos": photos.map((PhotoDto photo) => photo.toJson()).toList(),
        "status": PetStatus.values[status.index],
        "user_origin_id": userOriginId.toJson(),
        "user_guard_id": userGuardId?.toJson(),
        "user_candidate_ids": userCandidateIds?.map((UserDto user) => user.toJson()).toList(),
        "health_ids": healthIds,
        "hits": hits,
        "days_left_expired": daysLeftExpired,
        "distance_calculated": distanceCalculated,
        "register_status": registerStatus,
      };
}
