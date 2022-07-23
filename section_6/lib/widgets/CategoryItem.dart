import 'package:flutter/material.dart';
import 'package:section_6/screens/CategoryMeals.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final  String title;
  final Color color;

  CategoryItem({
    required this.id,
    required this.title,
    required this.color
  });

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
        '/category-meals',
        arguments: CategoryMealsArguments(categoryId: id, categoryTitle: title)
    );
  }

  @override
  Widget build(BuildContext context)  {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      onTap: () => selectCategory(context),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [color.withOpacity(0.5), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15)
        ),
        child: Text(
            title,
        ),
      ),
    );
  }
}
