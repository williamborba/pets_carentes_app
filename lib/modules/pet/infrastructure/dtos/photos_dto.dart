import 'package:equatable/equatable.dart';
import 'package:pets_carentes_app/modules/pet/index.dart';

class PhotoDto extends Equatable {
  final String asset;
  final bool featured;

  const PhotoDto({
    required this.asset,
    required this.featured,
  });

  @override
  List<Object?> get props => [
        asset,
        featured,
      ];

  factory PhotoDto.fromEntity({required Photo photo}) => PhotoDto(
        asset: photo.asset,
        featured: photo.featured,
      );

  factory PhotoDto.fromJson({required Map<String, dynamic> json}) => PhotoDto(
        asset: json['asset'],
        featured: json['featured'],
      );

  Photo toEntity() => Photo(
        asset: asset,
        featured: featured,
      );

  Map<String, dynamic> toJson() => {
        'asset': asset,
        'featured': featured,
      };
}
