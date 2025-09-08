import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../shared/api_constants.dart';
import '../data_models/sources_response.dart';

class SourcesDataSource {
  Future<SourcesResponse> getSources(String categoryId) async {
    final rui = Uri.https(ApiConstants.domain, ApiConstants.sourcesEndPoint, {
      "apiKey": ApiConstants.apiKey,
      "category": categoryId,
    });
    final response = await http.get(rui);
    final json = jsonDecode(response.body);
    return SourcesResponse.fromJson(json);
  }
}
