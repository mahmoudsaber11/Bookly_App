import 'package:bookly_app/Features/home/presentation/manger/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manger/newest_books_cubit/newest_books_states.dart';
import 'best_seller_list_view_item.dart';
import 'custom_loading_indicator.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsetBooksCubit, NewsetBooksStates>(
      builder: (context, state) {
        if (state is NewsetBooksSuccess) {
          return ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemBuilder: ((context, index) {
                return BookListViewItem(
                  bookModel: state.books[index],
                );
              }),
              separatorBuilder: ((context, index) => const SizedBox(
                    height: 20,
                  )),
              itemCount: state.books.length);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
