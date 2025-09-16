import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_application/sources/data/data_models/source_model.dart';
import 'package:news_application/sources/data/data_source/sources_data_source.dart';

import '../../../shared/api_constants.dart';
import '../data_models/sources_response.dart';

class SourcesApiDataSource extends SourcesDataSource {
  @override
  Future<List<SourceModel>> getSources(String categoryId) async {
    final rui = Uri.https(ApiConstants.domain, ApiConstants.sourcesEndPoint, {
      "apiKey": ApiConstants.apiKey,
      "category": categoryId,
    });
    final response = await http.get(rui);
    final json = jsonDecode(response.body);
    final sourcesResponse = SourcesResponse.fromJson(json);
    if (sourcesResponse.status != "ok") {
      throw Exception("something went wrong");
    }
    final sources = sourcesResponse.sources;
    return sources;

    // Future<SourcesResponse> getSources(String categoryId) async {
    //   final rui = Uri.https(ApiConstants.domain, ApiConstants.sourcesEndPoint, {
    //     "apiKey": ApiConstants.apiKey,
    //     "category": categoryId,
    //   });
    //   final response = await http.get(rui);
    //   final json = jsonDecode(response.body);
    //   return SourcesResponse.fromJson(json);
    // }
  }
}
