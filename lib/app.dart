import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zeepalm_assessment/src/core/local/local_storage_repository.dart';
import 'package:zeepalm_assessment/src/core/local/shared_preferences_provider.dart';
import 'package:zeepalm_assessment/src/navigation/app_nav.dart';

import 'firebase_options.dart';

class App extends ConsumerWidget {
  const App({super.key});

  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    final pref = await SharedPreferences.getInstance();
    // await pref.clear();
    runApp(
      ProviderScope(
        overrides: [
          preferencesProvider.overrideWithValue(pref),
        ],
        child: const App(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(routerConfigProvider);
    ref.watch(localDataProvider);
    return MaterialApp.router(
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: const TextScaler.linear(1.0),
          ),
          child: child!,
        );
      },
      title: "Assessment",
      debugShowCheckedModeBanner: false,
      routerConfig: ref.read(routerConfigProvider),
    );
  }
}
