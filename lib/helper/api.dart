import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Api {
  final Dio dio = Dio();

  Future<dynamic> get({
    required String url,
    String? token,
  }) async {
    try {
      Map<String, String> headers = {};

      if (token != null) {
        headers.addAll(
          {"Authorization": "Bearer $token"},
        );
      }

      Response response = await dio.get(
        url,
        options: Options(headers: headers),
      );

      debugPrint(
          "Response: ${response.data}\nStatus Code: ${response.statusCode}");

      if (response.statusCode == 200) {
        return response.data;
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(e.response?.data["message"]);
      } else {
        throw Exception("Network or Request Error.");
      }
    }
  }
}
