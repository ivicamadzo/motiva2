import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import '../theme/app_spacing.dart';

class BoxBreathingScreen extends StatefulWidget {
  const BoxBreathingScreen({super.key});

  @override
  State<BoxBreathingScreen> createState() => _BoxBreathingScreenState();
}

class _BoxBreathingScreenState extends State<BoxBreathingScreen> {
  String phase = "INHALE";
  bool running = true;

  int completedCycles = 0;

  final AudioPlayer player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    startCycle();
  }

  Future<void> playSound(String asset) async {
    try {
      await player.stop();
      await player.setAsset(asset);
      await player.play();
    } catch (e) {
      debugPrint("Audio error: $e");
    }
  }

  Future<void> startCycle() async {
    while (running && mounted) {
      // INHALE
      setState(() => phase = "INHALE");
      await playSound('assets/sounds/inhale.mp3');
      await Future.delayed(const Duration(seconds: 4));

      if (!mounted || !running) break;

      // HOLD
      setState(() => phase = "HOLD");
      await playSound('assets/sounds/hold.mp3');
      await Future.delayed(const Duration(seconds: 4));

      if (!mounted || !running) break;

      // EXHALE
      setState(() => phase = "EXHALE");
      await playSound('assets/sounds/exhale.mp3');
      await Future.delayed(const Duration(seconds: 4));

      if (!mounted || !running) break;

      // HOLD
      setState(() => phase = "HOLD");
      await playSound('assets/sounds/hold.mp3');
      await Future.delayed(const Duration(seconds: 4));

      if (!mounted || !running) break;

      setState(() {
        completedCycles++;
      });

      if (completedCycles >= 10) {
        running = false;

        await playSound('assets/sounds/session_complete.mp3');

        await Future.delayed(const Duration(seconds: 2));

        if (!mounted) return;

        Navigator.pop(context);
        return;
      }
    }
  }

  @override
  void dispose() {
    running = false;
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double size = 180;

    if (phase == "INHALE") {
      size = 240;
    } else if (phase == "EXHALE") {
      size = 140;
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Box Breathing")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(seconds: 4),
              width: size,
              height: size,
              decoration: BoxDecoration(
                color: Theme.of(
                  context,
                ).colorScheme.primary.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Center(
                child: Text(
                  phase,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),

            const SizedBox(height: AppSpacing.xl),

            Text(
              "4s inhale • 4s hold • 4s exhale • 4s hold",
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            const SizedBox(height: 8),

            Text(
              "Cycle $completedCycles / 10",
              style: Theme.of(context).textTheme.bodySmall,
            ),

            const SizedBox(height: AppSpacing.lg),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Помага за подобар фокус, концентрација и контрола во стресни ситуации.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),

            const SizedBox(height: AppSpacing.xl),

            ElevatedButton.icon(
              onPressed: () {
                running = false;
                player.stop();
                Navigator.pop(context);
              },
              icon: const Icon(Icons.stop_circle_outlined),
              label: const Text("Stop Session"),
            ),
          ],
        ),
      ),
    );
  }
}
