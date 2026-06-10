import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(title: const Text('Progress')),

      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          children: [
            Card(
              child: ListTile(
                leading: const Icon(Icons.air),
                title: const Text('Breathing Sessions'),
                trailing: const Text('0'),
              ),
            ),

            const SizedBox(height: AppSpacing.sm),

            Card(
              child: ListTile(
                leading: const Icon(Icons.timer_outlined),
                title: const Text('Minutes Practiced'),
                trailing: const Text('0'),
              ),
            ),

            const SizedBox(height: AppSpacing.sm),

            Card(
              child: ListTile(
                leading: const Icon(Icons.local_fire_department_outlined),
                title: const Text('Current Streak'),
                trailing: const Text('0 days'),
              ),
            ),

            const SizedBox(height: AppSpacing.sm),

            Card(
              child: ListTile(
                leading: const Icon(Icons.emoji_events_outlined),
                title: const Text('Longest Streak'),
                trailing: const Text('0 days'),
              ),
            ),

            const SizedBox(height: AppSpacing.xl),

            Text(
              'Your wellness journey starts with a single breath.',
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: AppColors.textMuted),
            ),
          ],
        ),
      ),
    );
  }
}
