import 'package:bookly_app/Features/home/data/model/book_model/book_model.dart';

abstract class SearchStates {}

class SearchInitial extends SearchStates {}

class SearchLoading extends SearchStates {}

class SearchSuccess extends SearchStates {
  final List<BookModel> search;

  SearchSuccess(this.search);
}

class SearchFailure extends SearchStates {
  final String error;

  SearchFailure(this.error);
}
