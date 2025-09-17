import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/sources/view/widgets/tab_bar_widget.dart';
import 'package:news_application/sources/view_model/sources_states.dart';
import 'package:news_application/sources/view_model/sources_view_model.dart';

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
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocBuilder<SourcesViewModel, SourcesStates>(
        builder: (_, state) {
          if (state is SourcesLoadingState) {
            return Align(
              alignment: Alignment.topCenter,
              child: CircularProgressIndicator(),
            );
          } else if (state is SourcesErrorState) {
            return Text(
              state.errorMessage,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
            );
          } else if (state is SourcesSuccessState) {
            return TabBarWidget(sourcesList: state.sources);
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
