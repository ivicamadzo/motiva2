import 'package:flutter/material.dart';
import '../theme/app_spacing.dart';

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

  @override
  void initState() {
    super.initState();
    startCycle();
  }

  Future<void> startCycle() async {
    while (running && mounted) {
      setState(() => phase = "INHALE");
      await Future.delayed(const Duration(seconds: 4));

      if (!mounted || !running) break;

      setState(() => phase = "HOLD");
      await Future.delayed(const Duration(seconds: 7));

      if (!mounted || !running) break;

      setState(() => phase = "EXHALE");
      await Future.delayed(const Duration(seconds: 8));
    }
  }

  @override
  void dispose() {
    running = false;
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
              duration: const Duration(seconds: 1),
              width: size,
              height: size,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
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
              "Помага при анксиозост, паника и за полесно заспивање.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),

            const SizedBox(height: AppSpacing.xl),

            ElevatedButton.icon(
              onPressed: () {
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
