import 'package:equatable/equatable.dart';
import 'package:pets_carentes_app/modules/pet/index.dart';
import 'package:pets_carentes_app/modules/user/index.dart';

const int needyPetStatus = 1;
const int adoptPetStatus = 2;
const int originAdoptPetStatus = 3;

enum PetStatus { needy, adopt, originAdopt }

const int trueAccept = 1;
const int pendingAccept = 2;
const int falseAccept = 3;
const int revisionAccept = 4;

enum Accept { trueAccept, pending, falseAccept, revision }

const int dogSpecie = 1;
const int catSpecie = 2;
const int canarySpecie = 3;
const int pigIndianSpecie = 4;
const int rabbitSpecie = 5;
const int fishSpecie = 6;
const int hamsterSpecie = 7;

enum Specie { dog, cat, canary, pigIndian, rabbit, fish, hamster }

const int maleGender = 1;
const int femaleGender = 2;

enum Gender { male, female }

class Pet extends Equatable {
  final String id;
  final Location location;
  final Accept accept;
  final Specie specie;
  final Gender gender;
  final String breed;
  final int weight;
  final String content;
  final DateTime dateBirth;
  final DateTime dateCreate;
  final DateTime datePublish;
  final List<Photo> photos;
  final PetStatus status;
  final User userOriginId;
  final int hits;
  final int daysLeftExpired;
  final bool registerStatus;
  final DateTime? dateUpdate;
  final String? pageLink;
  final User? userGuardId;
  final List<User>? userCandidateIds;
  final List<String>? healthIds;
  final String? distanceCalculated;

  const Pet({
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
        datePublish,
        photos,
        status,
        userOriginId,
        hits,
        daysLeftExpired,
        registerStatus,
        dateUpdate,
        pageLink,
        userGuardId,
        userCandidateIds,
        healthIds,
        distanceCalculated,
      ];

  Pet copyWith({
    String? id,
    Location? location,
    Accept? accept,
    Specie? specie,
    Gender? gender,
    String? breed,
    int? weight,
    String? content,
    DateTime? dateBirth,
    DateTime? dateCreate,
    DateTime? datePublish,
    List<Photo>? photos,
    PetStatus? status,
    User? userOriginId,
    int? hits,
    int? daysLeftExpired,
    bool? registerStatus,
    DateTime? dateUpdate,
    String? pageLink,
    User? userGuardId,
    List<User>? userCandidateIds,
    List<String>? healthIds,
    String? distanceCalculated,
  }) =>
      Pet(
        id: id ?? this.id,
        location: location ?? this.location,
        accept: accept ?? this.accept,
        specie: specie ?? this.specie,
        gender: gender ?? this.gender,
        breed: breed ?? this.breed,
        weight: weight ?? this.weight,
        content: content ?? this.content,
        dateBirth: dateBirth ?? this.dateBirth,
        dateCreate: dateCreate ?? this.dateCreate,
        datePublish: datePublish ?? this.datePublish,
        photos: photos ?? this.photos,
        status: status ?? this.status,
        userOriginId: userOriginId ?? this.userOriginId,
        hits: hits ?? this.hits,
        daysLeftExpired: daysLeftExpired ?? this.daysLeftExpired,
        registerStatus: registerStatus ?? this.registerStatus,
        dateUpdate: dateUpdate ?? this.dateUpdate,
        pageLink: pageLink ?? this.pageLink,
        userGuardId: userGuardId ?? this.userGuardId,
        userCandidateIds: userCandidateIds ?? this.userCandidateIds,
        healthIds: healthIds ?? this.healthIds,
        distanceCalculated: distanceCalculated ?? this.distanceCalculated,
      );

  String getPetAgeFromBirthDate() {
    final difference = DateTime.now().difference(dateBirth);
    final years = difference.inDays ~/ 365;
    final months = (difference.inDays % 365) ~/ 30;
    final days = difference.inDays % 365 % 30;

    if (years > 0) return '$years anos';
    if (months > 0) return '$months meses';
    if (days > 0) return '$days dias';

    return '';
  }

  String getPetGender() {
    if (gender == Gender.female) return 'Fêmea';
    if (gender == Gender.male) return 'Macho';

    return '';
  }

  String getPetContentLimited() {
    if (content.length > 20) return '${content.substring(0, 20)}...';
    return content;
  }

  String getPetWeight() {
    if (weight > 0) return '${weight}Kg';
    return '';
  }
}
