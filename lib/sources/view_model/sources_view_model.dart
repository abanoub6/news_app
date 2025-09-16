import 'package:flutter/cupertino.dart';
import 'package:news_application/sources/data/data_models/source_model.dart';
import 'package:news_application/sources/repository/sources_repository.dart';
import '../data/data_source/sources_api_data_source.dart';

class SourcesViewModel with ChangeNotifier {
  SourcesRepository repository;
  SourcesViewModel()
    : repository = SourcesRepository(sourcesDataSource: SourcesApiDataSource());
  late List<SourceModel> sources;
  String? errorMessage;
  bool isLoading = false;
  Future<void> getSources(String categoryId) async {
    isLoading = true;
    notifyListeners();
    await repository.getSources(categoryId);
    sources = repository.sources;
    errorMessage = repository.errorMessage;
    isLoading = false;
    notifyListeners();
  }
}
