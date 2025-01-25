import 'package:books/features/home/cubit/books_cubit.dart';
import 'package:books/features/home/cubit/books_state.dart';
import 'package:books/features/home/widget/card_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/widget/app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(fontSize: 25, title: "Book shop"),
        body: BlocProvider(
          create: (context) => BooksCubit()..getBookCubit(),
          child: BlocBuilder<BooksCubit, BooksState>(
            builder: (context, state) {
              if (state is BooksLoadingState) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is BooksSuccessState) {
                print("length\t" * 7);
                print(state.list.length);
                return GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.7,
                  children: List.generate(state.list.length, (index) {
                    final model = state.list[index];
                    // print(model.description);
                    return CardHome(
                      info: model.volumeInfo,
                    );
                  }),
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ));
  }
}
