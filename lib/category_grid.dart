import 'package:flutter/material.dart';

import 'category_item.dart';

class CategoryGrid extends StatelessWidget {
  void Function(String id)? onCategoryClicked;
  CategoryGrid({super.key, this.onCategoryClicked});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pick your category of interest",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(height: 24),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                mainAxisExtent: 220,
              ),
              physics: BouncingScrollPhysics(),
              itemBuilder:
                  (BuildContext context, int index) => InkWell(
                    onTap:
                        () => onCategoryClicked!(
                          CategoryItem.categories[index].id,
                        ),
                    child: CategoryItem.categories[index],
                  ),
              itemCount: CategoryItem.categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
