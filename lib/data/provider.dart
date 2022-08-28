import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_search_clean/data/api.dart';
import '../model/photo.dart';

class PhotoProvider extends InheritedWidget {
  final PixabayApi api;
  

  final _photoStreamController = StreamController<List<Photo>>()..add([]);
  Stream<List<Photo>> get photoStream => _photoStreamController.stream;

  PhotoProvider({Key? key, required this.api, required super.child})
      : super(key: key);

  static PhotoProvider of(BuildContext context) {
    final PhotoProvider? result =
        context.dependOnInheritedWidgetOfExactType<PhotoProvider>();
    assert(result != null, 'No PixabayApi found in context');

    return result!;
  }

  Future<void> fetch(String query) async {
    final result = await api.fetch(query);
    _photoStreamController.add(result);
  }

  @override
  bool updateShouldNotify(PhotoProvider oldWidget) {
    return oldWidget.api != api;
  }
}
