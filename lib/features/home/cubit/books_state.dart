
import '../model/home_model.dart';

abstract class BooksState {}

class BooksInitial extends BooksState {}
class BooksLoadingState extends BooksState {}
class BooksSuccessState extends BooksState {
  List<Item>list;

  BooksSuccessState({required this.list});
}
