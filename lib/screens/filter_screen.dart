import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  @override
  static const routeName = '/filters';
  final Map<String, bool> filters;
  Function updatefilters;
  FilterScreen(this.filters, this.updatefilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool isglutenfree = false;

  bool isvegan = false;

  bool isvegeteranian = false;

  bool islactosefree = false;
  // List<Map<String, bool>> filters;
  @override
  void initState() {
    isglutenfree = widget.filters['gluten'];
    isvegan = widget.filters['vegan'];
    isvegeteranian = widget.filters['vegeteranian'];
    islactosefree = widget.filters['lactose'];

    super.initState();
  }

  Widget buildFilterSwitch(
      String title, String description, Function updateval, bool currVal) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currVal,
      onChanged: updateval,
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Filters',
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedmeals = {
                'gluten': isglutenfree,
                'vegan': isvegan,
                'vegeteranian': isvegeteranian,
                'lactose': islactosefree,
              };
              widget.updatefilters(selectedmeals);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              'Adjust your selecetions!',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildFilterSwitch(
                    'Gluten-Free', 'only include gluten free meals', (val) {
                  setState(() {
                    isglutenfree = val;
                  });
                }, isglutenfree),
                buildFilterSwitch('Vegan ', 'only incldude vegan meals', (val) {
                  setState(() {
                    isvegan = val;
                  });
                }, isvegan),
                buildFilterSwitch('Vegeteranian', 'only include veg  meals',
                    (val) {
                  setState(() {
                    isvegeteranian = val;
                  });
                }, isvegeteranian),
                buildFilterSwitch(
                    'Lactose-Free ', 'only incldude lactose free meals', (val) {
                  setState(() {
                    islactosefree = val;
                  });
                }, islactosefree),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
