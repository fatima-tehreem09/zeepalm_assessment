import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart';
import 'package:zeepalm_assessment/src/util/extensions/size_extension.dart';
import 'package:zeepalm_assessment/src/widgets/app_textfield.dart';
import 'package:zeepalm_assessment/src/widgets/inter_text.dart';
import 'package:zeepalm_assessment/src/widgets/primary_button.dart';

import '../../../const/colors.dart';
import '../../../widgets/app_bar.dart';
import '../providers/video_upload_provider/video_upload_provider.dart';

class VideoUploadScreen extends ConsumerWidget {
  const VideoUploadScreen.builder(
    BuildContext context,
    GoRouterState state, {
    super.key,
  });

  static const String path = '/upload';
  static const String name = 'videoUpload';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(videoUploadProvider);

    return Scaffold(
      backgroundColor: AppColors.primaryScaffoldBg,
      appBar: const AppBarWidget(
        title: "Upload Video",
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Video Preview
            if (state.videoFile != null)
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: VideoPreview(videoFile: state.videoFile!),
                  ),
                ),
              )
            else
              Container(
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text('No video selected'),
                ),
              ),
            16.height,

            // Upload Progress
            if (state.isUploading)
              Column(
                children: [
                  LinearProgressIndicator(value: state.uploadProgress),
                  8.height,
                  Text(
                    'Uploading: ${(state.uploadProgress * 100).toStringAsFixed(1)}%',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),

            16.height,

            // Caption Input
            AppTextField(
              hint: 'Add a caption to your video...',
              onChanged: (value) =>
                  ref.read(videoUploadProvider.notifier).updateCaption(value),
            ),

            16.height,

            // Error Message
            if (state.error != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(
                  state.error!,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              ),

            20.height,
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    isLoading: state.isUploading,
                    onPressed: () =>
                        ref.read(videoUploadProvider.notifier).pickVideo(),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.video_library,
                          color: AppColors.primaryScaffoldBg,
                        ),
                        5.width,
                        InterText(
                          'Select Video',
                          color: AppColors.primaryScaffoldBg,
                        ),
                      ],
                    ),
                  ),
                ),
                16.width,
                Expanded(
                  child: AppButton(
                    isLoading: state.isUploading || state.videoFile == null,
                    onPressed: () =>
                        ref.read(videoUploadProvider.notifier).uploadVideo(),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.upload_outlined,
                          color: AppColors.primaryScaffoldBg,
                        ),
                        5.width,
                        InterText(
                          'Upload Video',
                          color: AppColors.primaryScaffoldBg,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class VideoPreview extends StatefulWidget {
  final File videoFile;
  const VideoPreview({required this.videoFile, super.key});

  @override
  State<VideoPreview> createState() => _VideoPreviewState();
}

class _VideoPreviewState extends State<VideoPreview> {
  late VideoPlayerController _controller;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(widget.videoFile)
      ..initialize().then((_) {
        setState(() {
          _initialized = true;
        });
        _controller.setLooping(true);
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _initialized
        ? VideoPlayer(_controller)
        : const Center(child: CircularProgressIndicator());
  }
}
