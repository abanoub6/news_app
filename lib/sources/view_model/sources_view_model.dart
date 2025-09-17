import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/sources/repository/sources_repository.dart';
import 'package:news_application/sources/view_model/sources_states.dart';
import '../data/data_source/sources_api_data_source.dart';

class SourcesViewModel extends Cubit<SourcesStates> {
  late final SourcesRepository repository;

  SourcesViewModel() : super(SourcesInitialState()) {
    repository = SourcesRepository(sourcesDataSource: SourcesApiDataSource());
  }

  Future<void> getSources(String categoryId) async {
    emit(SourcesLoadingState());
    try {
      await repository.getSources(categoryId);
      emit(SourcesSuccessState(sources: repository.sources));
    } catch (error) {
      emit(SourcesErrorState(errorMessage: error.toString()));
    }
  }
}

// class SourcesViewModel with ChangeNotifier {
//   SourcesRepository repository;
//   SourcesViewModel()
//     : repository = SourcesRepository(sourcesDataSource: SourcesApiDataSource());
//   late List<SourceModel> sources;
//   String? errorMessage;
//   bool isLoading = false;
//   Future<void> getSources(String categoryId) async {
//     isLoading = true;
//     notifyListeners();
//     await repository.getSources(categoryId);
//     sources = repository.sources;
//     errorMessage = repository.errorMessage;
//     isLoading = false;
//     notifyListeners();
//   }
// }
