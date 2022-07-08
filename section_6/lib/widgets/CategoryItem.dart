import 'package:flutter/material.dart';


class CategoryItem extends StatelessWidget {
  final String id;
  final  String title;
  final Color color;

  CategoryItem({
    required this.id,
    required this.title,
    required this.color
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(1.5)
      ),
      child: Text(title),
    );
  }
}
