import 'package:flutter/material.dart';
import 'categories_screen.dart';
import '../models/meal.dart';
import 'favourites_screen.dart';
import '../widgets/main_drawer.dart';

class TabScreen extends StatefulWidget {
  @override
  final List<Meal> favouriteMeals;
  TabScreen(this.favouriteMeals);
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  void _selectMeal(index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      {'page': Categories_Screen(), 'title': Text('Categories')},
      {
        'page': FavouritesScreen(widget.favouriteMeals),
        'title': Text('Favourites')
      }
    ];
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _pages[_selectedPageIndex]['title'],
      ),
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectMeal,
          unselectedItemColor: Colors.white,
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedPageIndex,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              label: 'Categories',
              icon: Icon(Icons.category),
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              label: 'Favourites',
              icon: Icon(Icons.star),
            )
          ]),
      body: _pages[_selectedPageIndex]['page'],
    );
  }
}
