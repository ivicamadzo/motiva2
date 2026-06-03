import 'package:flutter/material.dart';

import 'package:motiva2/screens/home_screen.dart';
import 'package:motiva2/screens/relaxing_breathing_screen.dart';
import 'package:motiva2/screens/box_breathing_screen.dart';
import 'package:motiva2/screens/four_seven_eight_breathing_screen.dart';
import 'package:motiva2/screens/knowledge_screen.dart';
import 'package:motiva2/screens/about_screen.dart';
import 'package:motiva2/screens/breathing_menu_screen.dart';
import 'package:motiva2/screens/panic_flow_screen.dart';
import 'package:motiva2/screens/grounding_screen.dart';
import 'package:motiva2/screens/panic_screen.dart';

import 'package:motiva2/theme/app_theme.dart';

void main() {
  runApp(const MotivaApp());
}

class MotivaApp extends StatelessWidget {
  const MotivaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Motiva',
      theme: AppTheme.light,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/panic': (context) => const PanicFlowScreen(),
        '/breathing': (context) => const BreathingMenuScreen(),
        '/grounding': (context) => const GroundingScreen(),
        '/panic-help': (context) => const PanicScreen(),
        '/relaxing-breathing': (context) => const RelaxingBreathingScreen(),
        '/box-breathing': (context) => const BoxBreathingScreen(),
        '/learn': (context) => const KnowledgeScreen(),
        '/about': (context) => const AboutScreen(),
        '/four-seven-eight-breathing': (context) =>
            const FourSevenEightBreathingScreen(),
      },
    );
  }
}
