import 'package:news_application/sources/data/data_models/source_model.dart';

abstract class SourcesStates {}

class SourcesInitialState extends SourcesStates {}

class SourcesLoadingState extends SourcesStates {}

class SourcesSuccessState extends SourcesStates {
  final List<SourceModel> sources;
  SourcesSuccessState({required this.sources});
}

class SourcesErrorState extends SourcesStates {
  final String errorMessage;
  SourcesErrorState({required this.errorMessage});
}
