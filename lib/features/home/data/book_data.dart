import 'package:dio/dio.dart';

import '../model/home_model.dart';

class BookData {
  Future<List<Item>> getBookData() async {
    final Dio dio = Dio();
    Response response = await dio.get(
      'https://www.googleapis.com/books/v1/volumes?Filtering=free-ebooks&Sorting=newest%20&q=computer%20science',
    );
    Map<String, dynamic> jsonData = response.data;
    try {
      if (response.statusCode == 200) {
        List bookItem = jsonData["items"];
        print(response.data);
        List<Item> list = bookItem.map((e) => Item.fromJson(e)).toList();
        print(list);
        return list;
      } else {
        throw Exception("error");
      }
    } on DioException catch (e) {
      if (e.response != null) {
        return e.response!.data;
      } else {
        throw Exception("error");
      }
    }
  }
}
