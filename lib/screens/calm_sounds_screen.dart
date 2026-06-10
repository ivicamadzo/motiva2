import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../services/audio_service.dart';

class CalmSoundsScreen extends StatefulWidget {
  const CalmSoundsScreen({super.key});

  @override
  State<CalmSoundsScreen> createState() => _CalmSoundsScreenState();
}

class _CalmSoundsScreenState extends State<CalmSoundsScreen> {
  String? currentSound;

  @override
  void initState() {
    super.initState();

    // 🔥 SAFE SYNC (don’t crash if null)
    final asset = AudioService.currentAsset;
    if (asset != null) {
      currentSound = _extractId(asset);
    }
  }

  String _extractId(String path) {
    return path.split('/').last.split('.').first;
  }

  Future<void> _toggleSound(
    String soundId,
    String assetPath,
    String soundName,
  ) async {
    final isSame = currentSound == soundId;

    await AudioService.stop();

    if (isSame) {
      setState(() => currentSound = null);
      return;
    }

    setState(() => currentSound = soundId);

    await AudioService.play(assetPath);
  }

  Widget _soundTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required String soundId,
    required String assetPath,
  }) {
    final isPlaying = currentSound == soundId;

    return Card(
      color: isPlaying
          ? AppColors.primary.withValues(alpha: 0.12)
          : AppColors.surface,
      child: ListTile(
        leading: Icon(
          icon,
          color: isPlaying ? AppColors.primary : AppColors.textSecondary,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: isPlaying ? FontWeight.bold : FontWeight.normal,
            color: AppColors.textPrimary,
          ),
        ),
        subtitle: Text(subtitle, style: TextStyle(color: AppColors.textMuted)),
        trailing: Icon(
          isPlaying ? Icons.pause_circle_filled : Icons.play_circle_fill,
          size: 32,
          color: isPlaying ? AppColors.primary : AppColors.textSecondary,
        ),
        onTap: () => _toggleSound(soundId, assetPath, title),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(title: const Text('Calm Sounds')),

      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          const SizedBox(height: AppSpacing.sm),

          Text(
            'Choose a calming sound',
            style: Theme.of(context).textTheme.headlineSmall,
          ),

          const SizedBox(height: AppSpacing.sm),

          Text(
            'Relax, focus, or fall asleep with peaceful ambient sounds.',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: AppColors.textMuted),
          ),

          const SizedBox(height: AppSpacing.lg),

          _soundTile(
            icon: Icons.water_drop_outlined,
            title: 'Rain',
            subtitle: 'Relaxing rain ambience',
            soundId: 'rain',
            assetPath: 'assets/sounds/rain.mp3',
          ),

          const SizedBox(height: AppSpacing.sm),

          _soundTile(
            icon: Icons.forest_outlined,
            title: 'Forest',
            subtitle: 'Nature and birds',
            soundId: 'forest',
            assetPath: 'assets/sounds/forest.mp3',
          ),

          const SizedBox(height: AppSpacing.sm),

          _soundTile(
            icon: Icons.waves_outlined,
            title: 'Ocean',
            subtitle: 'Gentle ocean waves',
            soundId: 'ocean',
            assetPath: 'assets/sounds/ocean.mp3',
          ),

          const SizedBox(height: AppSpacing.sm),

          _soundTile(
            icon: Icons.local_fire_department_outlined,
            title: 'Fireplace',
            subtitle: 'Warm fire crackling',
            soundId: 'fireplace',
            assetPath: 'assets/sounds/fireplace.mp3',
          ),

          const SizedBox(height: AppSpacing.lg),
        ],
      ),
    );
  }
}
