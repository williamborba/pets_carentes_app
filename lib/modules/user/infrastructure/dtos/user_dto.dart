import 'package:equatable/equatable.dart';
import 'package:pets_carentes_app/modules/user/index.dart';

class UserDto extends Equatable {
  final String id;
  final ProviderDto provider;
  final ProfileDto profile;
  final String fcmToken;
  final String platform;
  final bool ads;
  final bool paidSubscriber;
  final DateTime dateCreate;
  final bool registerStatus;
  final List<String>? chatUserIdBlock;
  final DateTime? dateUpdate;

  const UserDto({
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

  factory UserDto.fromEntity({required User user}) => UserDto(
        id: user.id,
        provider: ProviderDto.fromEntity(provider: user.provider),
        profile: ProfileDto.fromEntity(profile: user.profile),
        fcmToken: user.fcmToken,
        platform: user.platform,
        ads: user.ads,
        paidSubscriber: user.paidSubscriber,
        chatUserIdBlock: user.chatUserIdBlock,
        dateCreate: user.dateCreate,
        dateUpdate: user.dateUpdate,
        registerStatus: user.registerStatus,
      );

  factory UserDto.fromJson({required Map<String, dynamic> json}) => UserDto(
        id: json['_id'],
        provider: ProviderDto.fromJson(json: json['provider']),
        profile: ProfileDto.fromJson(json: json['profile']),
        fcmToken: json['fcm_token'],
        platform: json['platform'],
        ads: json['ads'],
        paidSubscriber: json['paid_subscriber'],
        chatUserIdBlock: json['chat_user_id_block'],
        dateCreate: DateTime.parse(json['date_create']),
        dateUpdate: json['date_update'] != null ? DateTime.parse(json['date_update']) : null,
        registerStatus: json['register_status'],
      );

  User toEntity() => User(
        id: id,
        provider: provider.toEntity(),
        profile: profile.toEntity(),
        fcmToken: fcmToken,
        platform: platform,
        ads: ads,
        paidSubscriber: paidSubscriber,
        chatUserIdBlock: chatUserIdBlock,
        dateCreate: dateCreate,
        dateUpdate: dateUpdate,
        registerStatus: registerStatus,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'provider': provider.toJson(),
        'profile': profile.toJson(),
        'fcm_token': fcmToken,
        'platform': platform,
        'ads': ads,
        'paid_subscriber': paidSubscriber,
        'chat_user_id_block': chatUserIdBlock,
        'date_create': dateCreate.toIso8601String(),
        'date_update': dateUpdate != null ? dateUpdate!.toIso8601String() : null,
        'register_status': registerStatus,
      };
}
