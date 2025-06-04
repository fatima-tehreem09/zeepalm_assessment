import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/video_model.dart';
import '../../../../services/video_upload_service.dart';

final videoFeedProvider = StreamProvider<List<VideoModel>>((ref) {
  final videoStream = ref.watch(videoUploadServiceProvider).getVideos();
  return videoStream.map((snapshot) {
    return snapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      return VideoModel(
        id: doc.id,
        videoUrl: data['videoUrl'] as String,
        thumbnailUrl: data['thumbnailUrl'] as String,
        description: data['caption'] as String,
        userId: data['userId'] as String,
        username: data['username'] as String? ?? 'Unknown',
        likes: (data['likes'] as int?) ?? 0,
      );
    }).toList();
  });
});
