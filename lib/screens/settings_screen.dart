import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(title: const Text('Settings')),

      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          Card(
            child: SwitchListTile(
              value: true,
              onChanged: null,
              title: const Text('Daily Reminders'),
              subtitle: const Text('Coming soon'),
            ),
          ),

          const SizedBox(height: AppSpacing.sm),

          Card(
            child: ListTile(
              leading: const Icon(Icons.volume_up_outlined),
              title: const Text('Sounds'),
              subtitle: const Text('Coming soon'),
            ),
          ),

          const SizedBox(height: AppSpacing.sm),

          Card(
            child: ListTile(
              leading: const Icon(Icons.palette_outlined),
              title: const Text('Theme'),
              subtitle: const Text('Coming soon'),
            ),
          ),

          const SizedBox(height: AppSpacing.sm),

          Card(
            child: ListTile(
              leading: const Icon(Icons.language_outlined),
              title: const Text('Language'),
              subtitle: const Text('Coming soon'),
            ),
          ),
        ],
      ),
    );
  }
}
