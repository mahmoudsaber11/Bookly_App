import 'package:bookly_app/Features/search/data/repo/search_repo.dart';
import 'package:bookly_app/Features/search/presentation/manger/search_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit(this.searchRepo) : super(SearchInitial());

  static SearchCubit get(context) => BlocProvider.of(context);
  final SearchRepo searchRepo;

  Future<void> getSearch({required val}) async {
    emit(SearchLoading());
    var result = await searchRepo.getSearch(val);
    result.fold((failure) {
      emit(SearchFailure(failure.toString()));
    }, (search) {
      emit(SearchSuccess(search));
    });
  }
}
