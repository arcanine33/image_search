import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:image_search/data/data_source/result.dart';
import 'package:image_search/domain/repository/photo_api_repository.dart';
import 'package:image_search/domain/model/photo.dart';

class HomeViewModel with ChangeNotifier {
  final PhotoApiRepository repository;

  List<Photo> _photos = [];

  List<Photo> get photos => _photos;

  HomeViewModel(this.repository);


  Future<void> fetch(String query) async {
    final Result<List<Photo>> result = await repository.fetch(query);
    result.when(
      success: (photos) {
        _photos = photos;
        notifyListeners();
      },
      error: (message) {},
    );
  }
}