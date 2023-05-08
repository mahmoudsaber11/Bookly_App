import 'package:bookly_app/Features/home/data/model/book_model/book_model.dart';
import 'package:bookly_app/Features/search/data/repo/search_repo.dart';
import 'package:bookly_app/core/utlies/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:bookly_app/core/errors/failures.dart';

class SearchRepoImpl extends SearchRepo {
  final ApiService apiService;

  SearchRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> getSearch(String val) async {
    try {
      var data = await apiService.get(
          endPoint: 'volumes?Filtering=free-ebooks&q= $val');
      List<BookModel> search = [];
      for (var item in data['item']) {
        search.add(BookModel.fromJson(item));
      }
      return right(search);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
