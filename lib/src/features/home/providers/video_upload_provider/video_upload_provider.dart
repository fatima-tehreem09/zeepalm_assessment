import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../services/auth_service.dart';
import '../../../../services/video_upload_service.dart';

final videoUploadProvider =
    StateNotifierProvider<VideoUploadNotifier, VideoUploadState>((ref) {
  return VideoUploadNotifier(ref);
});

class VideoUploadState {
  final File? videoFile;
  final String caption;
  final double uploadProgress;
  final bool isUploading;
  final String? error;

  VideoUploadState({
    this.videoFile,
    this.caption = '',
    this.uploadProgress = 0.0,
    this.isUploading = false,
    this.error,
  });

  VideoUploadState copyWith({
    File? videoFile,
    String? caption,
    double? uploadProgress,
    bool? isUploading,
    String? error,
  }) {
    return VideoUploadState(
      videoFile: videoFile ?? this.videoFile,
      caption: caption ?? this.caption,
      uploadProgress: uploadProgress ?? this.uploadProgress,
      isUploading: isUploading ?? this.isUploading,
      error: error,
    );
  }
}

class VideoUploadNotifier extends StateNotifier<VideoUploadState> {
  final Ref _ref;

  VideoUploadNotifier(this._ref) : super(VideoUploadState());

  Future<void> pickVideo() async {
    try {
      final picker = ImagePicker();
      final video = await picker.pickVideo(source: ImageSource.gallery);

      if (video != null) {
        state = state.copyWith(
          videoFile: File(video.path),
          error: null,
        );
      }
    } catch (e) {
      state = state.copyWith(error: 'Failed to pick video: $e');
    }
  }

  void updateCaption(String caption) {
    state = state.copyWith(caption: caption);
  }

  Future<void> uploadVideo() async {
    if (state.videoFile == null) {
      state = state.copyWith(error: 'Please select a video first');
      return;
    }

    final currentUser = _ref.read(authServiceProvider).currentUser;
    if (currentUser == null) {
      state = state.copyWith(error: 'Please sign in to upload videos');
      return;
    }

    try {
      state = state.copyWith(
        isUploading: true,
        uploadProgress: 0.0,
        error: null,
      );

      await _ref.read(videoUploadServiceProvider).uploadVideo(
            videoFile: state.videoFile!,
            userId: currentUser.uid,
            caption: state.caption,
            onProgress: (progress) {
              state = state.copyWith(uploadProgress: progress);
            },
          );

      state = state.copyWith(
        isUploading: false,
        videoFile: null,
        caption: '',
        uploadProgress: 0.0,
      );
    } catch (e) {
      state = state.copyWith(
        isUploading: false,
        error: 'Failed to upload video: $e',
      );
    }
  }
}
