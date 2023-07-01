import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import 'package:flutter_complete_guide/models/meal.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;
  FavouritesScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty)
      return Center(child: Text("No Favourites Yes"));
    else {
      return ListView.builder(
          itemBuilder: (ctx, ind) {
            return MealItem(
              id: favouriteMeals[ind].id,
              title: favouriteMeals[ind].title,
              affordability: favouriteMeals[ind].affordability,
              complexity: favouriteMeals[ind].complexity,
              duration: favouriteMeals[ind].duration,
              imageURL: favouriteMeals[ind].imageUrl,
            );
          },
          itemCount: favouriteMeals.length);
    }
  }
}
