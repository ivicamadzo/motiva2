import 'package:flutter/material.dart';
import '../theme/app_spacing.dart';

class KnowledgeScreen extends StatelessWidget {
  const KnowledgeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Learn")),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Што е паничен напад?",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              "Паничниот напад е реакција на нервниот систем. Не е опасен, и поминува.",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              "Што да правиш:",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: AppSpacing.sm),
            Text("• Диши бавно", style: Theme.of(context).textTheme.bodyLarge),
            Text("• Седи мирно", style: Theme.of(context).textTheme.bodyLarge),
            Text(
              "• Фокус на сегашноста",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              "• Почекај да помине",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
