import '../data/data_models/article.dart';

abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsLoadingState extends NewsStates {}

class NewsErrorState extends NewsStates {
  final String errorMessage;
  NewsErrorState({required this.errorMessage});
}

class NewsSuccessState extends NewsStates {
  final List<Article> news;
  NewsSuccessState({required this.news});
}
