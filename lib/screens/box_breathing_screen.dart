import 'package:flutter/material.dart';
import '../theme/app_spacing.dart';

class BoxBreathingScreen extends StatefulWidget {
  const BoxBreathingScreen({super.key});

  @override
  State<BoxBreathingScreen> createState() => _BoxBreathingScreenState();
}

class _BoxBreathingScreenState extends State<BoxBreathingScreen> {
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
      await Future.delayed(const Duration(seconds: 4));

      if (!mounted || !running) break;

      setState(() => phase = "EXHALE");
      await Future.delayed(const Duration(seconds: 4));

      if (!mounted || !running) break;

      setState(() => phase = "HOLD");
      await Future.delayed(const Duration(seconds: 4));
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
                color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
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
