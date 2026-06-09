import 'package:flutter/material.dart';
import '../theme/app_spacing.dart';

class GroundingScreen extends StatelessWidget {
  const GroundingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Grounding")),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Фокусирај се на сегашноста",
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            const SizedBox(height: AppSpacing.lg),

            const Text("👀 5 работи што ги гледаш"),
            const SizedBox(height: AppSpacing.md),

            const Text("✋ 4 работи што ги допираш"),
            const SizedBox(height: AppSpacing.md),

            const Text("👂 3 работи што ги слушаш"),
            const SizedBox(height: AppSpacing.md),

            const Text("👃 2 работи што ги мирисаш"),
            const SizedBox(height: AppSpacing.md),

            const Text("👅 1 работа што ја вкусиш"),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: const Text("продолжи"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
