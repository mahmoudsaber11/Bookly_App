import 'package:bookly_app/Features/search/presentation/manger/search_cubit.dart';
import 'package:bookly_app/Features/search/presentation/manger/search_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../home/presentation/views/widgets/best_seller_list_view_item.dart';
import '../../../../home/presentation/views/widgets/custom_loading_indicator.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchStates>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          return ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemBuilder: ((context, index) {
                return BookListViewItem(
                  bookModel: state.search[index],
                );
              }),
              separatorBuilder: ((context, index) => const SizedBox(
                    height: 20,
                  )),
              itemCount: state.search.length);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
