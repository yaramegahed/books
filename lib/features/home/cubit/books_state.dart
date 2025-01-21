
import '../model/home_model.dart';

abstract class BooksState {}

class BooksInitial extends BooksState {}
class BooksLoadingState extends BooksState {}
class BooksSuccessState extends BooksState {
  List<VolumeInfo>list;

  BooksSuccessState({required this.list});
}
