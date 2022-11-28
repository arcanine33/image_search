import 'package:image_search/data/data_source/result.dart';
import 'package:image_search/domain/model/photo.dart';
import 'package:image_search/domain/repository/photo_api_repository.dart';

class GetPhotosUseCase{
  PhotoApiRepository repository;

  GetPhotosUseCase(this.repository);

  Future<Result<List<Photo>>> execute(String query) async {
    final result = await repository.fetch(query);
    return result.when(success: (photos) {
      return Result.success(photos.sublist(0, 3));
    }, error: (message) {
      return Result.error(message);
    });
  }
}