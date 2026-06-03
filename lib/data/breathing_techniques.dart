class BreathingPattern {
  final String name;
  final int inhale;
  final int hold;
  final int exhale;
  final String description;

  BreathingPattern({
    required this.name,
    required this.inhale,
    required this.hold,
    required this.exhale,
    required this.description,
  });
}

final List<BreathingPattern> breathingPatterns = [
  BreathingPattern(
    name: "4-7-8 (Panic Relief)",
    inhale: 4,
    hold: 7,
    exhale: 8,
    description: "Силно смирување на нервниот систем",
  ),
  BreathingPattern(
    name: "Box Breathing",
    inhale: 4,
    hold: 4,
    exhale: 4,
    description: "Фокус и стабилизација",
  ),
  BreathingPattern(
    name: "Long Exhale",
    inhale: 4,
    hold: 0,
    exhale: 6,
    description: "Активира parasympathetic system",
  ),
];
