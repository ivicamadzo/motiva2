import 'package:flutter/material.dart';
import '../theme/app_spacing.dart';
import 'package:just_audio/just_audio.dart';

class FourSevenEightBreathingScreen extends StatefulWidget {
  const FourSevenEightBreathingScreen({super.key});

  @override
  State<FourSevenEightBreathingScreen> createState() =>
      _FourSevenEightBreathingScreenState();
}

class _FourSevenEightBreathingScreenState
    extends State<FourSevenEightBreathingScreen> {
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
      await Future.delayed(const Duration(seconds: 7));

      if (!mounted || !running) break;

      // EXHALE
      setState(() => phase = "EXHALE");
      await playSound('assets/sounds/exhale.mp3');
      await Future.delayed(const Duration(seconds: 8));

      if (!mounted || !running) break;

      setState(() {
        completedCycles++;
      });

      if (completedCycles >= 10) {
        running = false;

        await playSound('assets/sounds/session_complete.mp3');

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
      appBar: AppBar(title: const Text("4-7-8 Breathing")),
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
                shape: BoxShape.circle,
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
              "4s inhale → 7s hold → 8s exhale",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              "Cycle ${completedCycles >= 10 ? 10 : completedCycles + 1} / 10",
              style: Theme.of(context).textTheme.bodySmall,
            ),

            const SizedBox(height: AppSpacing.lg),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Помага при анксиозност, паника и за полесно заспивање.",
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
