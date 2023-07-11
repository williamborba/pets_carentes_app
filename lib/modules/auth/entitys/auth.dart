import 'package:equatable/equatable.dart';
import 'package:pets_carentes_app/modules/user/index.dart';

class Auth extends Equatable {
  final String token;
  final User user;

  const Auth({
    required this.token,
    required this.user,
  });

  @override
  List<Object?> get props => [
        token,
        user,
      ];

  Auth copyWith({
    String? token,
    User? user,
  }) =>
      Auth(
        token: token ?? this.token,
        user: user ?? this.user,
      );
}
