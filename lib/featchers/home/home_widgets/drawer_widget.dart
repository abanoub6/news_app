import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  void Function(DrawerItem) onItemClicked;
  DrawerWidget({super.key, required this.onItemClicked});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: theme.primaryColor,
              borderRadius: BorderRadius.only(
                // bottomRight: Radius.circular(50),
                bottomLeft: Radius.circular(50),
              ),
            ),
            width: double.infinity,
            height:
                AppBar().preferredSize.height + // طول ال app par
                MediaQuery.of(context).padding.top, // طول ال status bar
          ),
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Icon(Icons.menu),
                TextButton(
                  onPressed: () => onItemClicked(DrawerItem.categories),
                  child: Text("Categories", style: theme.textTheme.bodyLarge),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Icon(Icons.settings),
                TextButton(
                  onPressed: () => onItemClicked(DrawerItem.settings),
                  child: Text("Settings", style: theme.textTheme.bodyLarge),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

enum DrawerItem { categories, settings }
