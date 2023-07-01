import 'package:flutter/material.dart';
import '../dummy_data.dart';

class Meal_Detail_Screen extends StatelessWidget {
  static const routeName = '/meal-detail';
  Function togglefavourite;
  Function isFavourite;
  Meal_Detail_Screen(this.togglefavourite, this.isFavourite);

  Widget buildSectiontitle(String title, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  Widget buildContainer(child, context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey)),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(horizontal: 5),
      height: 210,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;

    final selected_meal = DUMMY_MEALS.firstWhere((meal) {
      return meal.id == mealId;
    });
    return Scaffold(
      appBar: AppBar(title: Text('${selected_meal.title}')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              child: Image.network(
                selected_meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectiontitle("Ingrediants", context),
            buildContainer(
                ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Text(selected_meal.ingredients[index])),
                    );
                  },
                  itemCount: selected_meal.ingredients.length,
                ),
                context),
            buildSectiontitle("Recipes", context),
            buildContainer(
                ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text('${index + 1}'),
                          ),
                          title: Text(selected_meal.steps[index]),
                        ),
                        Divider(),
                      ],
                    );
                  },
                  itemCount: selected_meal.steps.length,
                ),
                context),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          togglefavourite(selected_meal.id);
        },
        child: Icon(
            isFavourite(selected_meal.id) ? Icons.star : Icons.star_border),
      ),
    );
  }
}
