import 'package:flutter/material.dart';
import 'package:news_application/featchers/home/home_widgets/tab_bar_item.dart';

import '../../../data/api/api_sevices.dart';
import '../../../data/api/source/sources_response.dart';
import 'news_item_widget.dart';

class TabBarWidget extends StatefulWidget {
  int selectedTabIndex = 0;
  final AsyncSnapshot<SourcesResponse> snapshot;

  TabBarWidget({super.key, required this.snapshot});

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  @override
  Widget build(BuildContext context) {
    final sources = widget.snapshot.data?.sources ?? [];
    return DefaultTabController(
      length: sources.length,
      child: Column(
        children: [
          TabBar(
            indicator: BoxDecoration(color: Colors.transparent),
            dividerColor: Colors.transparent,
            onTap: (index) => setState(() => widget.selectedTabIndex = index),
            tabAlignment: TabAlignment.start,
            // by default >> offSet
            isScrollable: true,
            // by default >> false
            indicatorColor: Colors.green,
            tabs:
                sources
                    .map(
                      (source) => TabBarItem(
                        source: source.name ?? ,
                        isSelected:
                            widget.selectedTabIndex == sources.indexOf(source),
                      ),
                    )
                    .toList(),
          ),
          FutureBuilder(
            future: ApiServices.getArticles(
              sources[widget.selectedTabIndex].id,
            ),
            builder: (context, newsSnapshot) {
              if (newsSnapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (newsSnapshot.hasError ||
                  newsSnapshot.data?.status != "ok") {
                return Center(child: Text("Something went wrong"));
              } else {
                return Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder:
                        (context, index) => NewsItemWidget(
                          article: newsSnapshot.data!.articles[index],
                        ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
