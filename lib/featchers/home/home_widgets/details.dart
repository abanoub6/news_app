import 'package:flutter/material.dart';

import 'package:news_application/featchers/home/home_widgets/tab_bar_widget.dart';

import '../../../data/api/api_sevices.dart';

class Details extends StatefulWidget {
  final String categoryId;

  const Details({super.key, required this.categoryId});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiServices.getSources(widget.categoryId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError || snapshot.data!.status != "ok") {
          return Text("something went wrong ");
        } else {
          return TabBarWidget(snapshot: snapshot);
        }
      },
    );
  }
}
