import 'dart:async';
import 'package:image_search_clean/data/photo_repository_api.dart';

import '../../model/photo.dart';

class HomeViewModel {
  final PhotoApiRepository repository;

  HomeViewModel(this.repository);

  final _photoStreamController = StreamController<List<Photo>>()..add([]);
  Stream<List<Photo>> get photoStream => _photoStreamController.stream;

  Future<void> fetch(String query) async {
    final result = await repository.fetch(query);
    _photoStreamController.add(result);
  }
}
