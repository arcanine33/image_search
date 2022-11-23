import 'dart:convert';

import 'package:image_search/model/photo.dart';
import 'package:http/http.dart' as http;
class PixabayApi {
  final baseUrl = 'https://pixabay.com/api/';
  final key = '31513340-a3e2d13e307b941f062f336b9';

  Future<List<Photo>> fetch(String query) async{
    String url = '$baseUrl?key=$key&q=$query&image_type=photo';

    final response = await http.get(Uri.parse(url));

    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    Iterable hits = jsonResponse['hits'];
    return hits.map((e) => Photo.fromJson(e)).toList();
  }
}