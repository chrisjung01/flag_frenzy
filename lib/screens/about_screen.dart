import 'package:flag_frenzy/utils/custom_logger.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flag_frenzy/providers/settings_provider.dart';

class AboutScreen extends ConsumerWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsNotifierProvider);
    final language = settings.language;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
        title: const Text('Über'),
      ),
      body: FutureBuilder<PackageInfo>(
        future: PackageInfo.fromPlatform(),
        builder: (context, snapshot) {
          final logger = ref.read(customLoggerProvider);
          logger
              .log('AboutScreen build with version ${snapshot.data?.version}');

          final version = snapshot.data?.version ?? '1.0.0';
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Flag Frenzy $version'),
                const SizedBox(height: 20),
                const Text('Verwendete Bibliotheken:'),
                const SizedBox(height: 10),
                const Text('• Flutter/Dart'),
                const Text('• Flame Game Engine'),
                const Text('• Flutter Riverpod'),
                const Text('• Go Router'),
                const Text('• Package Info Plus'),
                const SizedBox(height: 20),
                const Text('Entwickelt mit ❤️ von:'),
                const Text('• Christian Jung'),
                const Text('• GitHub Copilot'),
              ],
            ),
          );
        },
      ),
    );
  }
}
