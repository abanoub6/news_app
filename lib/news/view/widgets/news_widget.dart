import 'package:flutter/material.dart';
import 'package:news_application/news/view_model/news_view_model.dart';
import 'package:provider/provider.dart';
import 'news_item_widget.dart';

class NewsWidget extends StatefulWidget {
  final String sourceId;
  const NewsWidget({super.key, required this.sourceId});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  final viewModel = NewsViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNews(widget.sourceId);
  }

  @override
  Widget build(BuildContext context) {
    viewModel.getNews(widget.sourceId);
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<NewsViewModel>(
        builder: (_, viewModel, _) {
          if (viewModel.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (viewModel.errorMessage != null) {
            return Center(child: Text(viewModel.errorMessage!));
          } else {
            return Expanded(
              child: ListView.builder(
                itemCount: viewModel.news.length,
                itemBuilder:
                    (context, index) =>
                        NewsItemWidget(article: viewModel.news[index]),
              ),
            );
          }
        },
      ),
    );
  }
}
