import 'dart:convert';

import 'package:api/models/photo_model.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<List<Photos>> getPhotos() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

    if (response.statusCode == 200) {
      return Photos.fromJsonList(jsonDecode(response.body));
    } else {
      throw Exception("Failed to add user");
    }
  }
}
