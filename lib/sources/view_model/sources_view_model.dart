import 'package:flutter/cupertino.dart';
import 'package:news_application/sources/data/data_models/source_model.dart';
import '../data/data_source/sources_data_source.dart';

class SourcesViewModel with ChangeNotifier {
  List<SourceModel> sources = [];
  String? errorMessage;
  bool isLoading = false;
  Future<void> getSources(String categoryId) async {
    isLoading = true;
    notifyListeners();
    try {
      final sourcesResponse = await SourcesDataSource().getSources(categoryId);
      if (sourcesResponse.status == 'ok' &&
          sourcesResponse.sources.isNotEmpty) {
        sources = sourcesResponse.sources;
      } else {
        errorMessage = "Something went wrong";
      }
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
