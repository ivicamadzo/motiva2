import 'package:flutter/material.dart';

class BreathingMenuScreen extends StatelessWidget {
  const BreathingMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Breathing Exercises")),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            "Choose your breathing technique",
            style: Theme.of(context).textTheme.headlineMedium,
          ),

          const SizedBox(height: 10),

          Text(
            "Pick what fits your current state.",
            style: Theme.of(context).textTheme.bodyMedium,
          ),

          const SizedBox(height: 30),

          // 🌿 Relaxing Breathing
          _BreathingCard(
            title: "Relaxing Breath",
            subtitle: "4s inhale → 6s exhale",
            icon: Icons.spa,
            color: Colors.green,
            onTap: () {
              Navigator.pushNamed(context, '/relaxing-breathing');
            },
          ),

          const SizedBox(height: 15),

          // ⬜ Box Breathing
          _BreathingCard(
            title: "Box Breathing",
            subtitle: "4-4-4-4 technique",
            icon: Icons.crop_square,
            color: Colors.blue,
            onTap: () {
              Navigator.pushNamed(context, '/box-breathing');
            },
          ),

          const SizedBox(height: 15),

          // 🫁 4-7-8 Breathing
          _BreathingCard(
            title: "4-7-8 Breathing",
            subtitle: "Panic relief technique",
            icon: Icons.self_improvement,
            color: Colors.deepPurple,
            onTap: () {
              Navigator.pushNamed(context, '/four-seven-eight-breathing');
            },
          ),

          const SizedBox(height: 40),

          Center(
            child: Text(
              "Take control of your breath → calm your mind",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _BreathingCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _BreathingCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: color.withValues(alpha: 0.2)),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.5),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color),
            ),

            const SizedBox(width: 15),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(subtitle, style: TextStyle(color: Colors.grey.shade600)),
                ],
              ),
            ),

            const Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }
}
