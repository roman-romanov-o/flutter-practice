import 'package:flutter/material.dart';
import 'package:section_6/dummy_categories.dart';
import 'package:section_6/widgets/CategoryItem.dart';


class CategoriesPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cooking app')),
      body: GridView(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
        childAspectRatio: 0.7,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
      ),
      children: DUMMY_CATEGORIES.map(
        (cat) => CategoryItem(
            id: cat.id,
            title: cat.title,
            color: cat.color
        )
      ).toList(),
    ),
    );
  }
}
