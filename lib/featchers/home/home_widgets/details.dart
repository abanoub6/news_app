import 'package:flutter/material.dart';
import 'package:news_application/featchers/home/home_widgets/news_item_widget.dart';
import 'package:news_application/featchers/home/home_widgets/tab_bar_item.dart';

class Details extends StatefulWidget {
  final String id;

  const Details({super.key, required this.id});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int selectedTabIndex = 0;
  List<String> sources = List.generate(10, (index) => "source ${index + 1}");

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: sources.length,
          child: TabBar(
            indicator: BoxDecoration(color: Colors.transparent),
            dividerColor: Colors.transparent,
            onTap: (index) => setState(() => selectedTabIndex = index),
            tabAlignment: TabAlignment.start,
            // by default >> offSet
            isScrollable: true,
            // by default >> false
            indicatorColor: Colors.green,
            tabs:
                sources
                    .map(
                      (source) => TabBarItem(
                        source: source,
                        isSelected: selectedTabIndex == sources.indexOf(source),
                      ),
                    )
                    .toList(),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder:
                (context, index) =>
                    NewsItemWidget(source: sources[selectedTabIndex]),
          ),
        ),
      ],
    );
  }
}
