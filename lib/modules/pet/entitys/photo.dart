import 'package:equatable/equatable.dart';

class Photo extends Equatable {
  final String asset;
  final bool featured;

  const Photo({
    required this.asset,
    required this.featured,
  });

  @override
  List<Object?> get props => [
        asset,
        featured,
      ];

  Photo copyWith({
    String? asset,
    bool? featured,
  }) =>
      Photo(
        asset: asset ?? this.asset,
        featured: featured ?? this.featured,
      );
}
