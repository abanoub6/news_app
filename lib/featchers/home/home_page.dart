import 'package:flutter/material.dart';
import 'package:news_application/featchers/settings/settings.dart';

import 'home_widgets/category_grid.dart';
import 'home_widgets/details.dart';
import 'home_widgets/drawer_widget.dart';

class Homepage extends StatefulWidget {
  static const String routeName = "/";

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("assets/images/main_background.png"),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: DrawerWidget(onItemClicked: onItemClicked),
        appBar: AppBar(
          title: Text("News app", style: theme.textTheme.titleMedium),
        ),
        body:
            selectedCategoryId != null
                ? Details(id: selectedCategoryId!)
                : selectedItem == DrawerItem.categories
                ? CategoryGrid(onCategoryClicked: onCategoryClicked)
                : Settings(),
      ),
    );
  }

  DrawerItem selectedItem = DrawerItem.categories;
  String? selectedCategoryId;
  void onItemClicked(DrawerItem item) {
    selectedItem = item;
    setState(() {});
    selectedCategoryId = null;
    Navigator.pop(context);
  }

  void onCategoryClicked(String id) {
    selectedCategoryId = id;
    setState(() {});
  }
}
