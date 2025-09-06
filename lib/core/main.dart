import 'package:flutter/material.dart';

import 'app_theme.dart';
import '../featchers/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {Homepage.routeName: (context) => Homepage()},
      initialRoute: Homepage.routeName,
      theme: AppTheme.light,
      themeMode: ThemeMode.light,
    );
  }
}
