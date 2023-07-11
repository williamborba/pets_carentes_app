import 'package:equatable/equatable.dart';

const int protectorProfileType = 1;
const int commonProfileType = 2;
const int adminProfileType = 3;

enum ProfileType { protector, common, admin }

class Profile extends Equatable {
  final ProfileType profileType;
  final String? name;
  final String? photo;
  final String? whatsapp;
  final String? instagram;
  final String? facebook;
  final String? donation;

  const Profile({
    required this.profileType,
    this.name,
    this.photo,
    this.whatsapp,
    this.instagram,
    this.facebook,
    this.donation,
  });

  @override
  List<Object?> get props => [
        profileType,
        name,
        photo,
        whatsapp,
        instagram,
        facebook,
        donation,
      ];

  Profile copyWith({
    required String? name,
    required String? photo,
    required String? whatsapp,
    required String? instagram,
    required String? facebook,
    required String? donation,
    ProfileType? profileType,
  }) =>
      Profile(
        name: name,
        photo: photo,
        whatsapp: whatsapp,
        instagram: instagram,
        facebook: facebook,
        donation: donation,
        profileType: profileType ?? this.profileType,
      );
}
