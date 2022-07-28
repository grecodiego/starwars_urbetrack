import 'dart:convert';
import 'package:dio/dio.dart';

class ReportApiService {
  final Dio _dio = Dio();

  final dateNow = DateTime.now();

  var url = 'https://jsonplaceholder.typicode.com/posts';

  Future fetchPost(characterName) async {
    Response response = await _dio.post(url, data: {
      'userId': 007,
      'dateTime': dateNow.toString(),
      'character_name': characterName
    });
    var resp = response;
    return resp;
  }
}
