import 'package:news_application/sources/data/data_source/sources_data_source.dart';

import '../data/data_models/source_model.dart';

class SourcesRepository {
  SourcesDataSource sourcesDataSource;
  SourcesRepository({required this.sourcesDataSource});
  String? errorMessage;
  List<SourceModel> sources = [];
  Future<void> getSources(String categoryId) async {
    try {
      sources = await sourcesDataSource.getSources(categoryId);
    } catch (error) {
      errorMessage = error.toString();
      sources = [];
    }
  }
}
