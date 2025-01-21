import 'package:dio/dio.dart';

import '../model/home_model.dart';

class BookData {
  Future<List<VolumeInfo>> getBookData() async {
    final Dio dio = Dio();
    Response response = await dio.get(
      'https://www.googleapis.com/books/v1/volumes?Filtering=free-ebooks&Sorting=newest%20&q=computer%20science',
    );
    Map<String, dynamic> jsonData = response.data;
    try {
      if (response.statusCode == 200) {
        List bookItem = jsonData["items"];
        List<VolumeInfo> map =
        bookItem.map((e) => VolumeInfo.fromJson(e)).toList();

        return map;
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