import 'package:flutter/material.dart';
import 'package:section_6/dummy_data.dart';
import 'package:section_6/widgets/CategoryItem.dart';


class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cooking app')),
      body: GridView(
        padding: const EdgeInsets.all(25),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
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
