import 'package:flutter/material.dart';
import 'screens/categories_screen.dart';
import './screens/tab_screen.dart';
import './screens/filter_screen.dart';
import './models/meal.dart';
import './dummy_data.dart';
import 'screens/categories_meal_screen.dart';
import './screens/meal_detail_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'vegan': false,
    'vegeteranian': false,
    'lactose': false
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];

  bool isFavourite(String id) {
    return _favouriteMeals.any((element) => element.id == id);
  }

  void _toggleFavourite(String mealid) {
    var selectedIndex = _favouriteMeals.indexWhere((meal) => meal.id == mealid);
    if (selectedIndex >= 0) {
      setState(() {
        _favouriteMeals.removeAt(selectedIndex);
      });
    } else {
      setState(() {
        _favouriteMeals
            .add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealid));
      });
    }
  }

  void _setFilters(Map<String, bool> savedFilters) {
    setState(() {
      filters = savedFilters;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (filters['gluten'] && !meal.isGlutenFree) return false;
        if (filters['vegan'] && !meal.isVegan) return false;
        if (filters['vegeteranian'] && !meal.isVegetarian) return false;
        if (filters['lactose'] && !meal.isLactoseFree) return false;
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyMedium: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            titleLarge: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            )),
      ),
      //
      //     ))),
      // home: TabScreen(),

      routes: {
        '/': (ctx) => TabScreen(_favouriteMeals),
        CategoriesMealsScreen.routeName: (ctx) =>
            CategoriesMealsScreen(_availableMeals),
        Meal_Detail_Screen.routeName: (ctx) =>
            Meal_Detail_Screen(_toggleFavourite, isFavourite),
        FilterScreen.routeName: (ctx) => FilterScreen(filters, _setFilters),
      },
      onGenerateRoute: (settings) {
        print(settings.name);
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) {
          return CategoriesMealsScreen(_availableMeals);
        });
      },
    );
  }
}
