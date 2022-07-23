import 'package:flutter/material.dart';
import 'package:section_6/dummy_data.dart';
import 'package:section_6/widgets/MealItem.dart';

class CategoryMealsArguments {
  final String categoryId;
  final String categoryTitle;

  CategoryMealsArguments({
    required this.categoryId,
    required this.categoryTitle
  });
}


class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments
      as CategoryMealsArguments;
    var categoryTitle = args.categoryTitle;
    var categoryId = args.categoryId;
    var categoryMeals = DUMMY_MEALS.where(
      (element) => element.categories.contains(categoryId)
    ).toList();



    return Scaffold(
      appBar: AppBar(
          title: Text(args.categoryTitle),
          toolbarTextStyle: TextStyle()
      ),
      body: Container(
        child: ListView.builder(itemBuilder: (_, index) {
          return MealItem(mealData: categoryMeals[index]);
        },
        itemCount: categoryMeals.length,
        ),
      ),
    );
  }
}