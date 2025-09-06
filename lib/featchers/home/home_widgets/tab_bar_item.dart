import 'package:flutter/material.dart';
import 'package:news_application/core/app_theme.dart';

class TabBarItem extends StatelessWidget {
  final String source;
  final bool isSelected;

  const TabBarItem({super.key, required this.source, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 23),
      padding: EdgeInsets.symmetric(vertical: 7, horizontal: 16),
      decoration: BoxDecoration(
        color: isSelected ? AppTheme.primary : Colors.transparent,
        border: Border.all(color: AppTheme.primary, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: Text(
        source,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
          color: isSelected ? AppTheme.white : AppTheme.primary,
        ),
      ),
    );
  }
}
