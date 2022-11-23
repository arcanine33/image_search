import 'dart:async';

import 'package:image_search/data/api.dart';
import 'package:image_search/model/photo.dart';

class HomeViewModel {
  final PixabayApi api;
  Stream<List<Photo>> get photoStream => _photoStreamController.stream;
  final _photoStreamController = StreamController<List<Photo>>()..add([]);

  HomeViewModel(this.api);


  Future<void> fetch(String query) async {
    final result = await api.fetch(query);
    _photoStreamController.add(result);
  }
}