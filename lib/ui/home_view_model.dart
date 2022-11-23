import 'dart:async';

import 'package:image_search/data/photo_api_repository.dart';
import 'package:image_search/model/photo.dart';

class HomeViewModel {
  final PhotoApiRepository repository;
  Stream<List<Photo>> get photoStream => _photoStreamController.stream;
  final _photoStreamController = StreamController<List<Photo>>()..add([]);

  HomeViewModel(this.repository);


  Future<void> fetch(String query) async {
    final result = await repository.fetch(query);
    _photoStreamController.add(result);
  }
}