import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String label;
  final String imageName;
  final Color color;
  final String id;
  const CategoryItem({
    required this.id,
    required this.label,
    required this.imageName,
    required this.color,
    super.key,
  });
  static List<CategoryItem> categories = [
    CategoryItem(
      id: "business",
      label: "Business",
      imageName: "bussines.png",
      color: const Color(0xFFC91C22),
    ),

    CategoryItem(
      id: "health",
      label: "Health",
      imageName: "health.png",
      color: const Color(0xFFED1E79),
    ),
    CategoryItem(
      id: "science",
      label: "Science",
      imageName: "science.png",
      color: const Color(0xFF4882CF),
    ),
    CategoryItem(
      id: "sports",
      label: "Sports",
      imageName: "sports.png",
      color: const Color(0xFFF2D352),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      color: color,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/$imageName", height: 80),
            SizedBox(height: 16),
            Text(
              label,
              style: theme.textTheme.bodyLarge?.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
