import 'package:news_application/news/data/data_models/article.dart';

abstract class NewsDataSource {
  Future<List<Article>> getNews(String sourceId);
}
