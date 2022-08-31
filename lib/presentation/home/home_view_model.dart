import 'dart:async';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:image_search_clean/data/photo_repository_api.dart';



import '../../model/photo.dart';

class HomeViewModel with ChangeNotifier{
  final PhotoApiRepository repository;
 

  List<Photo> _photos = [];
  UnmodifiableListView<Photo> get photos => UnmodifiableListView(_photos);

  bool _isLoading = false;
  bool get isLoading => _isLoading;


  

  HomeViewModel(this.repository);



  Future<void> fetch(String query) async {
   
    final result = await repository.fetch(query);
    _isLoading = true;
    notifyListeners();
    _photos = result;
    notifyListeners();
     _isLoading = false;
    notifyListeners();
  }
}
