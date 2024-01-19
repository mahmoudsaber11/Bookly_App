import 'package:bookly_app/Features/home/presentation/manger/featured_books_cubit/featured_cubit.dart';
import 'package:bookly_app/Features/home/presentation/manger/featured_books_cubit/featured_states.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'custom_list_view_item.dart';

class FeaturedBooksListView extends StatelessWidget {
  const   FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (() {
                      GoRouter.maybeOf(context)!.push(
                        '/bookDetailsView',
                        extra: state.books[index],
                      );
                    }),
                    child: CustomListViewItem(
                      imageUrl:
                          state.books[index].volumeInfo.imageLinks?.thumbnail ??
                              '',
                    ),
                  );
                },
                separatorBuilder: ((context, index) => const SizedBox(
                      width: 15,
                    )),
                itemCount: state.books.length),
          );
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
