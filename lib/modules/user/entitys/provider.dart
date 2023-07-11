import 'package:equatable/equatable.dart';

const int googleProviderType = 1;
const int facebookProviderType = 2;
const int emailProviderType = 3;

enum ProviderType { google, facebook, email }

class Provider extends Equatable {
  final ProviderType providerType;
  final int uid;
  final String email;
  final String? password;
  final String? photo;
  final String? name;

  const Provider({
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

  Provider copyWith({
    required String? password,
    required String? photo,
    required String? name,
    ProviderType? providerType,
    int? uid,
    String? email,
  }) =>
      Provider(
        password: password,
        photo: photo,
        name: name,
        providerType: providerType ?? this.providerType,
        uid: uid ?? this.uid,
        email: email ?? this.email,
      );
}
