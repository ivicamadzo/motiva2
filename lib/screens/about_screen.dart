import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text("About & Credits")),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: ListView(
          children: [
            Text("Motiva", style: Theme.of(context).textTheme.headlineLarge),

            const SizedBox(height: AppSpacing.sm),

            Text(
              "A calm support app for anxiety, panic, and breathing regulation.",
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            const SizedBox(height: AppSpacing.lg),

            Text(
              "🔊 Audio Credits",
              style: Theme.of(context).textTheme.headlineSmall,
            ),

            const SizedBox(height: AppSpacing.sm),

            Text(
              "Sound effects by Amber Johnson – Pixabay (pixabay.com)",
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: AppColors.textPrimary),
            ),

            const SizedBox(height: AppSpacing.lg),

            Text(
              "🎨 UI & Design",
              style: Theme.of(context).textTheme.headlineSmall,
            ),

            const SizedBox(height: AppSpacing.sm),

            Text(
              "Built using Flutter Material Design system.",
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: AppColors.textPrimary),
            ),

            const SizedBox(height: AppSpacing.lg),

            Text(
              "⚠️ Disclaimer",
              style: Theme.of(context).textTheme.headlineSmall,
            ),

            const SizedBox(height: AppSpacing.sm),

            Text(
              "This app is not a medical device. It is designed for relaxation and self-regulation techniques only.",
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary),
            ),

            const SizedBox(height: AppSpacing.xl),

            Center(
              child: Text(
                "Made with care ❤️",
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: AppColors.textMuted),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
