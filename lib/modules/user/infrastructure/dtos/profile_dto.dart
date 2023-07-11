import 'package:equatable/equatable.dart';
import 'package:pets_carentes_app/modules/user/index.dart';

class ProfileDto extends Equatable {
  final ProfileType profileType;
  final String? name;
  final String? photo;
  final String? whatsapp;
  final String? instagram;
  final String? facebook;
  final String? donation;

  const ProfileDto({
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

  factory ProfileDto.fromEntity({required Profile profile}) => ProfileDto(
        profileType: profile.profileType,
        name: profile.name,
        photo: profile.photo,
        whatsapp: profile.whatsapp,
        instagram: profile.instagram,
        facebook: profile.facebook,
        donation: profile.donation,
      );

  factory ProfileDto.fromJson({required Map<String, dynamic> json}) => ProfileDto(
        profileType: ProfileType.values[[
              protectorProfileType,
              commonProfileType,
              adminProfileType,
            ].firstWhere((int profile) => json['profile_type'] == profile) -
            1],
        name: json['name'],
        photo: json['photo'],
        whatsapp: json['whatsapp'],
        instagram: json['instagram'],
        facebook: json['facebook'],
        donation: json['donation'],
      );

  Profile toEntity() => Profile(
        profileType: profileType,
        name: name,
        photo: photo,
        whatsapp: whatsapp,
        instagram: instagram,
        facebook: facebook,
        donation: donation,
      );

  Map<String, dynamic> toJson() => {
        'profile_type': ProfileType.values[[
          0,
          protectorProfileType,
          commonProfileType,
          adminProfileType,
        ].firstWhere((int profile) => profileType.index == profile)],
        'name': name,
        'photo': photo,
        'whatsapp': whatsapp,
        'instagram': instagram,
        'facebook': facebook,
        'donation': donation,
      };
}
