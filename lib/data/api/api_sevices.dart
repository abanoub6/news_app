import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_application/data/api/source/sources_response.dart';

import 'api_constants.dart';
import 'news/news_response.dart';

class ApiServices {
  static Future<SourcesResponse> getSources(String categoryId) async {
    final rui = Uri.https(ApiConstants.domain, ApiConstants.sourcesEndPoint, {
      "apiKey": ApiConstants.apiKey,
      "category": categoryId,
    });
    final response = await http.get(rui);
    final json = jsonDecode(response.body);
    return SourcesResponse.fromJson(json);
  }

  static Future<NewsResponse> getArticles(String sourceId) async {
    final rui = Uri.https(ApiConstants.domain, ApiConstants.articlesEndPoint, {
      "apiKey": ApiConstants.apiKey,
      "sources": sourceId,
    });
    final response = await http.get(rui);
    final json = jsonDecode(response.body);
    return NewsResponse.fromJson(json);
  }
}
