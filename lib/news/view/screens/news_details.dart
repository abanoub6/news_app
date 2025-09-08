import 'package:flutter/material.dart';

import 'package:news_application/sources/view/widgets/tab_bar_widget.dart';
import 'package:news_application/sources/view_model/sources_view_model.dart';
import 'package:provider/provider.dart';

class NewsDetails extends StatefulWidget {
  final String categoryId;

  const NewsDetails({super.key, required this.categoryId});

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  final viewModel = SourcesViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.getSources(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<SourcesViewModel>(
        builder: (_, viewModel, _) {
          if (viewModel.isLoading == true) {
            return Align(
              alignment: Alignment.topCenter,
              child: CircularProgressIndicator(),
            );
          } else if (viewModel.errorMessage != null) {
            return Text(
              viewModel.errorMessage!,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
            );
          } else {
            return TabBarWidget(sourcesList: viewModel.sources);
          }
        },
      ),
    );
  }
}
