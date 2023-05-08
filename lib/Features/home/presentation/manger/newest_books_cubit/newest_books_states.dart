import 'package:bookly_app/Features/home/data/model/book_model/book_model.dart';

abstract class NewsetBooksStates {}

class NewsetBooksInitial extends NewsetBooksStates {}

class NewsetBooksLoading extends NewsetBooksStates {}

class NewsetBooksSuccess extends NewsetBooksStates {
  final List<BookModel> books;

  NewsetBooksSuccess(this.books);
}

class NewsetBooksFailure extends NewsetBooksStates {
  final String error;

  NewsetBooksFailure(this.error);
}
