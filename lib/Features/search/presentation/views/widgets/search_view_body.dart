import 'package:bookly_app/Features/search/data/repo/search_repo_impl.dart';
import 'package:bookly_app/Features/search/presentation/manger/search_cubit.dart';
import 'package:bookly_app/Features/search/presentation/views/widgets/custom_search_textfield.dart';
import 'package:bookly_app/Features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:bookly_app/core/utlies/api_service.dart';
import 'package:bookly_app/core/utlies/styles.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(SearchRepoImpl(ApiService(Dio()))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            CustomSearchTextField(),
            SizedBox(
              height: 16,
            ),
            Text(
              'Search Result',
              style: Styles.textStyle18,
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(child: SearchResultListView())
          ],
        ),
      ),
    );
  }
}
