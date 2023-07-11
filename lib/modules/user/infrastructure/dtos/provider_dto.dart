import 'package:equatable/equatable.dart';
import 'package:pets_carentes_app/index.dart';

class ProviderDto extends Equatable {
  final ProviderType providerType;
  final int uid;
  final String email;
  final String? password;
  final String? photo;
  final String? name;

  const ProviderDto({
    required this.providerType,
    required this.uid,
    required this.email,
    this.password,
    this.photo,
    this.name,
  });

  @override
  List<Object?> get props => [
        providerType,
        uid,
        email,
        password,
        photo,
        name,
      ];

  factory ProviderDto.fromEntity({required Provider provider}) => ProviderDto(
        providerType: provider.providerType,
        uid: provider.uid,
        email: provider.email,
        password: provider.password,
        photo: provider.photo,
        name: provider.name,
      );

  factory ProviderDto.fromJson({required Map<String, dynamic> json}) => ProviderDto(
        providerType: ProviderType.values[[
              googleProviderType,
              facebookProviderType,
              emailProviderType,
            ].firstWhere((int provider) => json['provider_type'] == provider) -
            1],
        uid: json['uid'],
        email: json['email'],
        password: json['password'],
        photo: json['photo'],
        name: json['name'],
      );

  Provider toEntity() => Provider(
        providerType: providerType,
        uid: uid,
        email: email,
        password: password,
        photo: photo,
        name: name,
      );

  Map<String, dynamic> toJson() => {
        'provider_type': ProviderType.values[[
          0,
          googleProviderType,
          facebookProviderType,
          emailProviderType,
        ].firstWhere((int provider) => providerType.index == provider)],
        'uid': uid,
        'email': email,
        'password': password,
        'photo': photo,
        'name': name,
      };
}
