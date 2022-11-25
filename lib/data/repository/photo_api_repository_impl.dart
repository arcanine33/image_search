import 'dart:convert';

import 'package:image_search/domain/repository/photo_api_repository.dart';
import 'package:http/http.dart' as http;
import 'package:image_search/domain/model/photo.dart';

class PhotoApiRepositoryImpl implements PhotoApiRepository{
  static const baseUrl = 'https://pixabay.com/api/';
  static const key = '31513340-a3e2d13e307b941f062f336b9';

  @override
  Future<List<Photo>> fetch(String query, {http.Client? client}) async {
    client ??= http.Client();

    final response = await client.get(Uri.parse('$baseUrl?key=$key&q=$query&image_type=photo'));

    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    Iterable hits = jsonResponse['hits'];
    return hits.map((e) => Photo.fromJson(e)).toList();
  }
}