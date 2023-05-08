import 'package:bookly_app/Features/home/data/repos/home_repo.dart';
import 'package:bookly_app/Features/home/presentation/manger/newest_books_cubit/newest_books_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksStates> {
  NewsetBooksCubit(this.homeRepo) : super(NewsetBooksInitial());

  static NewsetBooksCubit get(context) => BlocProvider.of(context);
  final HomeRepo homeRepo;
  Future<void> fetchNewsetBooks() async {
    var result = await homeRepo.fetchNewsetBooks();
    result.fold((failure) {
      emit(NewsetBooksFailure(failure.toString()));
    }, (books) {
      emit(NewsetBooksSuccess(books));
    });
  }
}
