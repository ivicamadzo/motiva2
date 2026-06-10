import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import 'about_screen.dart';
import 'notifications_screen.dart';
import 'progress_screen.dart';
import 'settings_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(title: const Text("Profile")),

      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),

        children: [
          const SizedBox(height: AppSpacing.md),

          const CircleAvatar(
            radius: 40,
            child: Icon(Icons.self_improvement, size: 40),
          ),

          const SizedBox(height: AppSpacing.md),

          Center(
            child: Text(
              "Your Wellness Journey",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),

          const SizedBox(height: AppSpacing.xl),

          Card(
            child: ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text("About App"),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AboutScreen()),
                );
              },
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.notifications_outlined),
              title: const Text("Notifications"),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const NotificationsScreen(),
                  ),
                );
              },
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.bar_chart_outlined),
              title: const Text("Progress"),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ProgressScreen()),
                );
              },
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.settings_outlined),
              title: const Text("Settings"),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SettingsScreen()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
