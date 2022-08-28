import 'package:image_search_clean/model/photo.dart';

abstract class PhotoApiRepository {
  Future<List<Photo>> fetch(String query);
}
