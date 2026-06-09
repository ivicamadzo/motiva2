import 'package:flutter/material.dart';
import 'grounding_screen.dart';
import 'package:just_audio/just_audio.dart';
import '../theme/app_spacing.dart';

class RelaxingBreathingScreen extends StatefulWidget {
  final bool panicMode;

  const RelaxingBreathingScreen({super.key, this.panicMode = false});
  @override
  State<RelaxingBreathingScreen> createState() =>
      _RelaxingBreathingScreenState();
}

class _RelaxingBreathingScreenState extends State<RelaxingBreathingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  bool isInhale = true;
  bool _running = true;
  int completedCycles = 0;

  // 🔊 SINGLE AUDIO ENGINE (IMPORTANT FIX)
  final AudioPlayer player = AudioPlayer();

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    _animation = Tween<double>(
      begin: 0.8,
      end: 1.3,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

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
    while (_running && mounted) {
      // 🌬️ INHALE
      setState(() => isInhale = true);

      await playSound('assets/sounds/inhale.mp3');

      _controller.duration = const Duration(seconds: 4);
      await _controller.forward();

      if (!mounted || !_running) break;

      // 🌬️ EXHALE
      setState(() => isInhale = false);

      await playSound('assets/sounds/exhale.mp3');

      _controller.duration = const Duration(seconds: 6);
      await _controller.reverse();
      setState(() {
        completedCycles++;
      });

      if (widget.panicMode && completedCycles >= 10) {
        _running = false;

        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const GroundingScreen()),
          );
        }

        return;
      }

      if (completedCycles >= 10) {
        _running = false;

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
    _running = false;

    _controller.dispose();
    player.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Breathing")),

      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.scale(
                  scale: _animation.value,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isInhale
                          ? Theme.of(
                              context,
                            ).colorScheme.primary.withValues(alpha: 0.4)
                          : Theme.of(
                              context,
                            ).colorScheme.primary.withValues(alpha: 0.7),
                    ),
                    child: Icon(
                      Icons.air,
                      size: 60,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),

                const SizedBox(height: AppSpacing.sm),

                Text(
                  "4s inhale → 6s exhale",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
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
                    "Подолгото издишување му сигнализира на телото дека е безбедно да се релаксира и помага да се намали стресот.",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),

                const SizedBox(height: AppSpacing.xl),

                ElevatedButton.icon(
                  onPressed: () async {
                    _running = false;

                    await player.stop();

                    if (!mounted) return;

                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/',
                      (route) => false,
                    );
                  },
                  icon: const Icon(Icons.stop_circle_outlined),
                  label: const Text("Stop Session"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
