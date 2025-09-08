import 'package:flutter/widgets.dart';
import 'package:news_application/news/data/data_source/news_data_source.dart';
import '../data/data_models/article.dart';

class NewsViewModel with ChangeNotifier {
  List<Article> news = [];
  bool isLoading = false;
  String? errorMessage;
  Future<void> getNews(String sourceId) async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await NewsDataSource().getArticles(sourceId);
      if (response.status == "ok" && response.articles != []) {
        news = response.articles;
      } else {
        errorMessage = "something went wrong";
      }
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
