import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/meal.dart';
import '../screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageURL;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  // final Function removeMeal;

  const MealItem({
    this.id,
    this.title,
    this.imageURL,
    this.duration,
    this.complexity,
    this.affordability,
    // this.removeMeal
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Luxurious:
        return 'Luxurious';
      case Affordability.Pricey:
        return 'Pricey';
    }
  }

  void selectmeal(context) {
    Navigator.of(context)
        .pushNamed(Meal_Detail_Screen.routeName, arguments: id)
        .then((value) {
      // removeMeal(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectmeal(context),
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 4,
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.network(
                      imageURL,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                      bottom: 20,
                      right: 10,
                      child: Container(
                        width: 300,
                        color: Colors.black54,
                        child: Text(
                          title,
                          style: TextStyle(fontSize: 24, color: Colors.white),
                          overflow: TextOverflow.fade,
                          softWrap: true,
                        ),
                      ))
                ],
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.schedule),
                          SizedBox(
                            width: 6,
                          ),
                          Text('$duration min'),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.work),
                          SizedBox(
                            width: 6,
                          ),
                          Text('$complexityText'),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.attach_money),
                          SizedBox(
                            width: 6,
                          ),
                          Text('$affordabilityText'),
                        ],
                      )
                    ]),
              )
            ],
          )),
    );
  }
}
