import 'package:books/features/home/data/book_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'books_state.dart';

class BooksCubit extends Cubit<BooksState> {
  BookData bookData = BookData();
  BooksCubit get(context)=> BlocProvider.of(context);

  BooksCubit() : super(BooksInitial());

  getBookCubit() async {
    emit(BooksLoadingState());
    var success = await bookData.getBookData();
    emit(BooksSuccessState(list: success));
  }
}
