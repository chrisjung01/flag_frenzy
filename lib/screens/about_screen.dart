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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
        title: const Text('Über'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.indigo, Colors.blue],
          ),
        ),
        child: FutureBuilder<PackageInfo>(
          future: PackageInfo.fromPlatform(),
          builder: (context, snapshot) {
            final logger = ref.read(customLoggerProvider);
            logger.log('AboutScreen build with version ${snapshot.data?.version}');

            final version = snapshot.data?.version ?? '1.0.0';
            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Text(
                  'Flag Frenzy $version',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                const Text(
                  'Verwendete Bibliotheken:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                // todo(cj): Handle this the better way
                const Text('• Flutter/Dart',
                    style: TextStyle(color: Colors.white)),
                const Text('• Flame Game Engine',
                    style: TextStyle(color: Colors.white)),
                const Text('• Flutter Riverpod',
                    style: TextStyle(color: Colors.white)),
                const Text('• Go Router',
                    style: TextStyle(color: Colors.white)),
                const Text('• Package Info Plus',
                    style: TextStyle(color: Colors.white)),
                const SizedBox(height: 32),
                const Text(
                  'Entwickelt mit ❤️ von:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                const Text('• Christian Jung',
                    style: TextStyle(color: Colors.white)),
                const Text('• GitHub Copilot',
                    style: TextStyle(color: Colors.white)),
              ],
            );
          },
        ),
      ),
    );
  }
}
