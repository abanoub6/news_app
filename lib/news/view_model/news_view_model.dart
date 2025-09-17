import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/news/data/data_source/news_api_data_source.dart';
import 'package:news_application/news/repository/news_repository.dart';
import 'package:news_application/news/view_model/news_states.dart';

class NewsViewModel extends Cubit<NewsStates> {
  late final NewsRepository repository;

  NewsViewModel() : super(NewsInitialState()) {
    repository = NewsRepository(newsDataSource: NewsApiDataSource());
  }

  Future<void> getNews(String sourceId) async {
    emit(NewsLoadingState());
    try {
      await repository.getNews(sourceId);
      emit(NewsSuccessState(news: repository.news));
    } catch (error) {
      emit(NewsErrorState(errorMessage: error.toString()));
    }
  }
}
