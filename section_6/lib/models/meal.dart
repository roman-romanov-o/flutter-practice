enum Affordability {
  Affordable,
  Pricey,
  Luxurious
}

enum Complexity {
  Simple,
  Challenging,
  Hard,
}

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final Affordability affordability;
  final Complexity complexity;
  final String imageUrl;
  final int duration;
  final List<String> ingredients;
  final List<String> steps;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;

  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.affordability,
    required this.complexity,
    required this.imageUrl,
    required this.duration,
    required this.ingredients,
    required this.steps,
    required this.isGlutenFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.isLactoseFree
  });

  String get complexityText {
    switch(complexity) {
      case Complexity.Simple: return "Easy";
      case Complexity.Challenging: return "Challenging";
      case Complexity.Hard: return "Hard";
      default: return "Unknown";
    }
  }

  String get affordabilityText {
    switch(affordability) {
      case Affordability.Affordable: return "Affordable";
      case Affordability.Pricey: return "Pricey";
      case Affordability.Luxurious: return "Luxurious";
      default: return "Unknown";
    }
  }
}
