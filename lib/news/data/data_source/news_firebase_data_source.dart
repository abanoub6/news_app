import 'package:news_application/news/data/data_models/article.dart';
import 'package:news_application/news/data/data_source/news_data_source.dart';

class NewsFirebaseDataSource extends NewsDataSource {
  @override
  Future<List<Article>> getNews(String sourceId) {
    // TODO: implement getNews
    throw UnimplementedError();
  }
}
