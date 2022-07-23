import 'package:flutter/material.dart';
import 'package:section_6/models/meal.dart';

class MealItem extends StatelessWidget {
  final Meal mealData;
  const MealItem({required this.mealData});

  void chooseMeal() {}

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var screenHeight = mediaQuery.size.height;
    var screenWidth = mediaQuery.size.width;

    return InkWell(
      borderRadius: BorderRadius.all(const Radius.circular(15)),
      onTap: chooseMeal,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        elevation: 15,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(15),
                      topRight: const Radius.circular(15)
                  ),
                  child: Image.network(
                    mealData.imageUrl,
                    height: 250,
                    width: screenWidth,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    bottom: 10,
                    right: 10,
                    child: Container(
                      width: 200,
                      color: Colors.black54,
                      padding: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                      ),
                      child: Text(
                        mealData.title,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white
                        ),
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                    )
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 6),
                      Text('${mealData.duration}m')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 6),
                      Text('${mealData.complexityText}')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 6),
                      Text('${mealData.affordabilityText}')
                    ],
                  ),
                ],
              ),
            ),

          ],
        )
      )
    );
  }
}
