import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/news/view_model/news_view_model.dart';
import 'package:provider/provider.dart';
import '../../view_model/news_states.dart';
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
    super.initState();
    viewModel.getNews(widget.sourceId);
  }

  @override
  Widget build(BuildContext context) {
    viewModel.getNews(widget.sourceId);
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocBuilder<NewsViewModel, NewsStates>(
        builder: (_, state) {
          if (state is NewsLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is NewsErrorState) {
            return Center(child: Text(state.errorMessage));
          } else if (state is NewsSuccessState) {
            return Expanded(
              child: ListView.builder(
                itemCount: state.news.length,
                itemBuilder:
                    (context, index) =>
                        NewsItemWidget(article: state.news[index]),
              ),
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
