import 'package:flutter/material.dart';

import 'panic_mode_screen.dart';

class PanicFlowScreen extends StatefulWidget {
  const PanicFlowScreen({super.key});

  @override
  State<PanicFlowScreen> createState() => _PanicFlowScreenState();
}

class _PanicFlowScreenState extends State<PanicFlowScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const PanicModeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
