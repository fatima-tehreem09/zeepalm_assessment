import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  static Future<void> init() async {
    runApp(const ProviderScope(child: App()));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(debugShowCheckedModeBanner: false, title: 'ZeePalm');
  }
}
