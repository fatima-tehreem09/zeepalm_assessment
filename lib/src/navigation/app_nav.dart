import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:zeepalm_assessment/src/features/auth/views/sign_in_screen.dart';
import 'package:zeepalm_assessment/src/features/home/views/video_feed_screen.dart';
import 'package:zeepalm_assessment/src/features/home/views/video_upload_screen.dart';

import '../features/auth/views/sign_up_screen.dart';
import '../features/future_fusion/views/layout.dart';

final _navigatorKey = GlobalKey<NavigatorState>();

final routerConfigProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _navigatorKey,
    initialLocation: BasicLayout.routePath,
    routes: [
      GoRoute(
        path: BasicLayout.routePath,
        name: BasicLayout.routeName,
        builder: BasicLayout.builder,
      ),
      GoRoute(
        path: SignInScreen.path,
        name: SignInScreen.name,
        builder: SignInScreen.builder,
      ),
      GoRoute(
        path: SignUpScreen.path,
        name: SignUpScreen.name,
        builder: SignUpScreen.builder,
      ),
      GoRoute(
        path: VideoUploadScreen.path,
        name: VideoUploadScreen.name,
        builder: VideoUploadScreen.builder,
      ),
      GoRoute(
        path: VideoFeedScreen.path,
        name: VideoFeedScreen.name,
        builder: VideoFeedScreen.builder,
      ),
    ],
  );
});
