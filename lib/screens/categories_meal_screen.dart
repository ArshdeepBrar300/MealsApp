import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoriesMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeal;
  CategoriesMealsScreen(this.availableMeal);

  @override
  State<CategoriesMealsScreen> createState() => _CategoriesMealsScreenState();
}

class _CategoriesMealsScreenState extends State<CategoriesMealsScreen> {
  String catTitle;
  List<Meal> Category_meal;
  var _loadedinitData = false;

  @override
  void didChangeDependencies() {
    if (!_loadedinitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      catTitle = routeArgs['title'];
      final catId = routeArgs['id'];

      Category_meal = widget.availableMeal.where((meal) {
        return meal.categories.contains(catId);
      }).toList();
      _loadedinitData = true;

      // TODO: implement didChangeDependencies
    }
    super.didChangeDependencies();
  }

  // final String title;
  void removeMeal(String mealId) {
    print(mealId);
    setState(() {
      Category_meal.removeWhere((element) => mealId == element.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(catTitle),
      ),
      body: ListView.builder(
          itemBuilder: (ctx, ind) {
            return MealItem(
              id: Category_meal[ind].id,
              title: Category_meal[ind].title,
              affordability: Category_meal[ind].affordability,
              complexity: Category_meal[ind].complexity,
              duration: Category_meal[ind].duration,
              imageURL: Category_meal[ind].imageUrl,
            );
          },
          itemCount: Category_meal.length),
    );
  }
}
