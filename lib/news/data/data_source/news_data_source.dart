import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../shared/api_constants.dart';
import '../data_models/news_response.dart';

class NewsDataSource {
  Future<NewsResponse> getArticles(String sourceId) async {
    final rui = Uri.https(ApiConstants.domain, ApiConstants.articlesEndPoint, {
      "apiKey": ApiConstants.apiKey,
      "sources": sourceId,
    });
    final response = await http.get(rui);
    final json = jsonDecode(response.body);
    return NewsResponse.fromJson(json);
  }
}
