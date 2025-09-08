import 'package:flutter/material.dart';
import 'package:news_application/news/view/widgets/news_widget.dart';
import 'package:news_application/sources/data/data_models/source_model.dart';
import 'package:news_application/sources/view/widgets/tab_bar_item.dart';

class TabBarWidget extends StatefulWidget {
  final List<SourceModel> sourcesList;

  const TabBarWidget({super.key, required this.sourcesList});

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  int selectedTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    final sources = widget.sourcesList;
    return DefaultTabController(
      length: sources.length,
      child: Column(
        children: [
          TabBar(
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
                        source: source.name,
                        isSelected: selectedTabIndex == sources.indexOf(source),
                      ),
                    )
                    .toList(),
          ),
          NewsWidget(sourceId: sources[selectedTabIndex].id),
        ],
      ),
    );
  }
}
