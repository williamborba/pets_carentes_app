import 'package:equatable/equatable.dart';
import 'package:pets_carentes_app/modules/auth/index.dart';
import 'package:pets_carentes_app/modules/user/index.dart';

class AuthDto extends Equatable {
  final String token;
  final UserDto user;

  const AuthDto({
    required this.token,
    required this.user,
  });

  @override
  List<Object?> get props => [
        token,
        user,
      ];

  factory AuthDto.fromEntity({required Auth auth}) => AuthDto(
        token: auth.token,
        user: UserDto.fromEntity(user: auth.user),
      );

  factory AuthDto.fromJson(Map<String, dynamic> json) => AuthDto(
        token: json["token"],
        user: UserDto.fromJson(json: json["user"]),
      );

  Auth toEntity() => Auth(
        token: token,
        user: user.toEntity(),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "user": user.toJson(),
      };
}
