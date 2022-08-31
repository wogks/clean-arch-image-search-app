import 'dart:convert';
import 'package:image_search_clean/data/photo_repository_api.dart';

import '../model/photo.dart';
import 'package:http/http.dart' as http;

class PixabayApi implements PhotoApiRepository{ 
final baseUrl = 'https://pixabay.com/api/';
final key = '28871499-c75df118d01f09e96aaf02d60';

@override
  Future<List<Photo>> fetch(String query) async {
  final response = await http.get(
    Uri.parse(
        '$baseUrl?key=$key&q=$query&image_type=photo&pretty=true'),
  );
  Map<String, dynamic> json = jsonDecode(response.body);

  Iterable hits = json['hits'];

  return hits.map((e) => Photo.fromJson(e)).toList();
}
}