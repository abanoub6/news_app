import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final String id;
  const Details({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Text(id);
  }
}
