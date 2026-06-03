import 'package:flutter/material.dart';
import '../data/panic_steps.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';

class PanicScreen extends StatelessWidget {
  const PanicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Panic Help")),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Сега си безбеден. Ова е анксиозност, не опасност.",
              style: Theme.of(context).textTheme.headlineSmall,
            ),

            const SizedBox(height: AppSpacing.lg),

            Expanded(
              child: ListView.builder(
                itemCount: panicSteps.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: const Icon(
                        Icons.check_circle,
                        color: AppColors.success,
                      ),
                      title: Text(
                        panicSteps[index],
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: AppSpacing.md),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: const Text("Се чувствувам подобро"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
