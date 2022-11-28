import 'package:image_search/domain/model/photo.dart';

class HomeState {
  final List<Photo> photos;
  final bool isLoading;

  HomeState(this.photos, this.isLoading);

  HomeState copy({List<Photo>? photos, bool? isLoading}) {
    return HomeState(photos ??= this.photos, isLoading ??= this.isLoading);
  }
}