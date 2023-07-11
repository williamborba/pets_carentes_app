import 'package:equatable/equatable.dart';
import 'package:pets_carentes_app/modules/user/index.dart';

class User extends Equatable {
  final String id;
  final Provider provider;
  final Profile profile;
  final String fcmToken;
  final String platform;
  final bool ads;
  final bool paidSubscriber;
  final DateTime dateCreate;
  final bool registerStatus;
  final List<String>? chatUserIdBlock;
  final DateTime? dateUpdate;

  const User({
    required this.id,
    required this.provider,
    required this.profile,
    required this.fcmToken,
    required this.platform,
    required this.ads,
    required this.paidSubscriber,
    required this.dateCreate,
    required this.registerStatus,
    this.chatUserIdBlock,
    this.dateUpdate,
  });

  @override
  List<Object?> get props => [
        id,
        provider,
        profile,
        fcmToken,
        platform,
        ads,
        paidSubscriber,
        dateCreate,
        registerStatus,
        chatUserIdBlock,
        dateUpdate,
      ];

  User copyWith({
    required List<String>? chatUserIdBlock,
    required DateTime? dateUpdate,
    String? id,
    Provider? provider,
    Profile? profile,
    String? fcmToken,
    String? platform,
    bool? ads,
    bool? paidSubscriber,
    DateTime? dateCreate,
    bool? registerStatus,
  }) =>
      User(
        chatUserIdBlock: chatUserIdBlock,
        dateUpdate: dateUpdate,
        id: id ?? this.id,
        provider: provider ?? this.provider,
        profile: profile ?? this.profile,
        fcmToken: fcmToken ?? this.fcmToken,
        platform: platform ?? this.platform,
        ads: ads ?? this.ads,
        paidSubscriber: paidSubscriber ?? this.paidSubscriber,
        dateCreate: dateCreate ?? this.dateCreate,
        registerStatus: registerStatus ?? this.registerStatus,
      );
}
