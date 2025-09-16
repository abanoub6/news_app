import 'package:flutter/widgets.dart';
import 'package:news_application/news/data/data_source/news_api_data_source.dart';
import 'package:news_application/news/repository/news_repository.dart';
import '../data/data_models/article.dart';

class NewsViewModel with ChangeNotifier {
  NewsRepository newsRepository;
  NewsViewModel()
    : newsRepository = NewsRepository(newsDataSource: NewsApiDataSource());
  List<Article> news = [];
  bool isLoading = false;
  String? errorMessage;
  Future<void> getNews(String sourceId) async {
    isLoading = true;
    notifyListeners();
    await newsRepository.getNews(sourceId);
    news = newsRepository.news;
    isLoading = false;
    notifyListeners();
  }
}
