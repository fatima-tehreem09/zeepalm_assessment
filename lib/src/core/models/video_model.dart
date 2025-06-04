import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_model.freezed.dart';
part 'video_model.g.dart';

@freezed
class VideoModel with _$VideoModel {
  const factory VideoModel({
    required String id,
    required String videoUrl,
    required String thumbnailUrl,
    required String description,
    required String userId,
    required String username,
    @Default(0) int likes,
    @Default(false) bool isLiked,
    @Default(false) bool isSaved,
  }) = _VideoModel;

  factory VideoModel.fromJson(Map<String, dynamic> json) =>
      _$VideoModelFromJson(json);
} 