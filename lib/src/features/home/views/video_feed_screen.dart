import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:zeepalm_assessment/src/const/colors.dart';
import 'package:zeepalm_assessment/src/features/home/views/video_upload_screen.dart';
import 'package:zeepalm_assessment/src/util/extensions/size_extension.dart';
import 'package:zeepalm_assessment/src/widgets/app_bar.dart';

import '../../../widgets/video_actions.dart';
import '../../../widgets/video_player_widget.dart';
import '../providers/video_feed/video_feed_provider.dart';

class VideoFeedScreen extends ConsumerStatefulWidget {
  const VideoFeedScreen.builder(
    BuildContext context,
    GoRouterState state, {
    super.key,
  });

  static const String path = '/feed';
  static const String name = 'videoFeed';

  @override
  ConsumerState<VideoFeedScreen> createState() => _VideoFeedScreenState();
}

class _VideoFeedScreenState extends ConsumerState<VideoFeedScreen> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final videosAsync = ref.watch(videoFeedProvider);

    return Scaffold(
      backgroundColor: AppColors.primaryScaffoldBg,
      appBar: const AppBarWidget(
        title: "Video Feed",
      ),
      body: videosAsync.when(
        data: (videos) {
          if (videos.isEmpty) {
            return const Center(
              child: Text('No videos yet. Be the first to upload!'),
            );
          }

          return PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            itemCount: videos.length,
            itemBuilder: (context, index) {
              final video = videos[index];
              return Stack(
                fit: StackFit.expand,
                children: [
                  // Video Player
                  VideoPlayerWidget(
                    videoUrl: video.videoUrl,
                    thumbnailUrl: video.thumbnailUrl,
                  ),
                  // Video Actions
                  Positioned(
                    right: 16,
                    bottom: 100,
                    child: VideoActions(
                      video: video,
                      onLike: () {
                        // TODO: Implement like functionality
                      },
                      onSave: () {
                        // TODO: Implement save functionality
                      },
                      onDownload: () {
                        // TODO: Implement download functionality
                      },
                    ),
                  ),
                  // Video Description
                  Positioned(
                    left: 16,
                    right: 80,
                    bottom: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '@${video.username}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        8.height,
                        Text(
                          video.description,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) => Center(
          child: Text('Error: $error'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryBlue,
        onPressed: () {
          context.pushNamed(VideoUploadScreen.name);
        },
        child: const Icon(
          Icons.video_camera_back_outlined,
          color: AppColors.primaryScaffoldBg,
        ),
      ),
    );
  }
}
