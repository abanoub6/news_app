import 'package:news_application/news/data/data_source/news_data_source.dart';

import '../data/data_models/article.dart';

class NewsRepository {
  NewsDataSource newsDataSource;

  NewsRepository({required this.newsDataSource});

  String? errorMessage;
  List<Article> news = [];

  Future<void> getNews(String sourceId) async {
    try {
      news = await newsDataSource.getNews(sourceId);
    } catch (error) {
      errorMessage = error.toString();
    }
  }
}
