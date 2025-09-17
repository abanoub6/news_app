import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_application/news/data/data_models/article.dart';
import 'package:news_application/news/data/data_source/news_data_source.dart';

import '../../../shared/api_constants.dart';
import '../data_models/news_response.dart';

class NewsApiDataSource extends NewsDataSource {
  @override
  Future<List<Article>> getNews(String sourceId) async {
    final rui = Uri.https(ApiConstants.domain, ApiConstants.articlesEndPoint, {
      "apiKey": ApiConstants.apiKey,
      "sources": sourceId,
    });
    final response = await http.get(rui);
    final json = jsonDecode(response.body);
    final newsResponse = NewsResponse.fromJson(json);

    if (newsResponse.status != "ok") {
      throw Exception("something went wrong");
    }
    final articles = newsResponse.articles;
    return articles;
  }
}
