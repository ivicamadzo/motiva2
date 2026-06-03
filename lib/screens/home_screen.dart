import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_radius.dart';
import '../theme/app_spacing.dart';
import '../widgets/big_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(title: const Text("Motiva"), centerTitle: true),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: AppSpacing.sm),

              // 🧠 Calm header card
              Container(
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: AppRadius.mediumBorder,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Како се чувствуваш?",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      "Ако имаш анксиозност, притисни Panic Help веднаш.",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: AppSpacing.lg),

              // 🔴 EMERGENCY FIRST
              BigButton(
                text: "🆘 PANIC HELP (INSTANT RELIEF)",
                icon: Icons.warning,
                color: AppColors.danger,
                onTap: () {
                  Navigator.pushNamed(context, '/panic');
                },
              ),

              const SizedBox(height: AppSpacing.sm),

              // 🌿 BREATHING
              BigButton(
                text: "🌿 Breathing Exercises",
                icon: Icons.air,
                color: AppColors.success,
                onTap: () {
                  Navigator.pushNamed(context, '/breathing');
                },
              ),

              const SizedBox(height: AppSpacing.sm),

              // 📚 LEARN
              BigButton(
                text: "📚 Learn & Understand",
                icon: Icons.menu_book,
                color: AppColors.primary,
                onTap: () {
                  Navigator.pushNamed(context, '/learn');
                },
              ),

              const SizedBox(height: AppSpacing.xl),

              // 🧘 calm footer
              Text(
                "You are safe. This will pass.",
                textAlign: TextAlign.center,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: AppColors.textMuted),
              ),

              const SizedBox(height: AppSpacing.lg),

              // ℹ️ ABOUT
              BigButton(
                text: "About",
                icon: Icons.info,
                color: AppColors.textMuted,
                onTap: () {
                  Navigator.pushNamed(context, '/about');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
