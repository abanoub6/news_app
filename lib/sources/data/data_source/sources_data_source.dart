import 'package:news_application/sources/data/data_models/source_model.dart';

abstract class SourcesDataSource {
  Future<List<SourceModel>> getSources(String categoryId);
}
