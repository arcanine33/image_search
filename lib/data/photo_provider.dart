import 'package:flutter/cupertino.dart';
import 'package:image_search/data/api.dart';

class PhotoProvider extends InheritedWidget {
  final PixabayApi api;
  const PhotoProvider({required this.api, super.key, required super.child});

  static PhotoProvider of(BuildContext context) {
    final PhotoProvider? result =
        context.dependOnInheritedWidgetOfExactType<PhotoProvider>();
    assert(result != null, 'No pixabay Api found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(PhotoProvider oldWidget) {
    return oldWidget.api != api;
  }
}