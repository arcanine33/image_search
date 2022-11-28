import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:image_search/data/data_source/result.dart';
import 'package:image_search/domain/repository/photo_api_repository.dart';
import 'package:image_search/domain/model/photo.dart';
import 'package:image_search/presentation/home/home_ui_event.dart';

class HomeViewModel with ChangeNotifier {
  final PhotoApiRepository repository;

  List<Photo> _photos = [];

  List<Photo> get photos => _photos;

  final _eventController = StreamController<HomeUiEvent>();
  Stream<HomeUiEvent> get eventStream => _eventController.stream;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  HomeViewModel(this.repository);


  Future<void> fetch(String query) async {
    _isLoading = true;
    notifyListeners();
    final Result<List<Photo>> result = await repository.fetch(query);
    result.when(
      success: (photos) {
        _photos = photos;
        notifyListeners();
      },
      error: (message) {
        _isLoading = true;
        _eventController.add(HomeUiEvent.showSnackBar(message));
      },
    );
    _isLoading = false;
    notifyListeners();
  }
}