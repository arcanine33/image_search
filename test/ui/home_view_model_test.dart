import 'package:flutter_test/flutter_test.dart';
import 'package:image_search/data/photo_api_repository.dart';
import 'package:image_search/model/photo.dart';
import 'package:image_search/ui/home_view_model.dart';

void main() {
  test('Stream 이 잘 동작해야 한다 ', () async {
    final viewModel = HomeViewModel(FakePhotoApiRepository());

    await viewModel.fetch('apple');

    final result = fakeJson.map((e) => Photo.fromJson(e)).toList();
    expect(viewModel.photos, result);
  });
}

class FakePhotoApiRepository extends PhotoApiRepository {
  @override
  Future<List<Photo>> fetch(String query) async {
    Future.delayed(const Duration(milliseconds: 500));
    return fakeJson.map((e) => Photo.fromJson(e)).toList();
  }
}

List<Map<String, dynamic>> fakeJson = [
  {
    "id":2295434,
    "pageURL":"https://pixabay.com/photos/spring-bird-bird-tit-spring-blue-2295434/",
    "type":"photo",
    "tags":"spring bird, bird, tit",
    "previewURL":"https://cdn.pixabay.com/photo/2017/05/08/13/15/spring-bird-2295434_150.jpg",
    "previewWidth":150,
    "previewHeight":99,
    "webformatURL":"https://pixabay.com/get/gd771cbadbe6ac632ca330ffa0f79a63eef1948c6527111a895515f73437611da7b1f25ffc335c08ff6b58fdb8977ff74b6e986c8fbd204f3da9f249aaee8791b_640.jpg",
    "webformatWidth":640,
    "webformatHeight":426,
    "largeImageURL":"https://pixabay.com/get/gc70645f1594a555d22bb3f701596354a8987b3ea60f30c3c9acaff45c577752e50548f716a561bcf0c4a201e74baf8b919215276283fdc2fc4e9d5d97202aa64_1280.jpg",
    "imageWidth":5363,
    "imageHeight":3575,
    "imageSize":2938651,
    "views":580662,
    "downloads":326858,
    "collections":2005,
    "likes":1948,
    "comments":242,
    "user_id":334088,
    "user":"JillWellington",
    "userImageURL":"https://cdn.pixabay.com/user/2018/06/27/01-23-02-27_250x250.jpg"
  },
  {
    "id":3063284,
    "pageURL":"https://pixabay.com/photos/rose-flower-petal-floral-noble-3063284/",
    "type":"photo",
    "tags":"rose, flower, petal",
    "previewURL":"https://cdn.pixabay.com/photo/2018/01/05/16/24/rose-3063284_150.jpg",
    "previewWidth":150,
    "previewHeight":99,
    "webformatURL":"https://pixabay.com/get/g4f3380a0739bc79db31de4b8fb681e8764612148716ce2a9f8d7b56b37c3c86e7e2a44a8d0bef9c4d018fbc8a130d1d2229f134148c9f3ef329d9364a5018fa7_640.jpg",
    "webformatWidth":640,
    "webformatHeight":426,
    "largeImageURL":"https://pixabay.com/get/g1093580844a34aeb9ce6f47e7a7d7db5b48c332292d5acb96ce774847b8e0c93eb1b39d198b93e0b8cc4da5fadc9b07f7faf9314b1665205ea284550b1e8d772_1280.jpg",
    "imageWidth":6000,
    "imageHeight":4000,
    "imageSize":3574625,
    "views":1019914,
    "downloads":657630,
    "collections":1374,
    "likes":1511,
    "comments":329,
    "user_id":1564471,
    "user":"anncapictures",
    "userImageURL":"https://cdn.pixabay.com/user/2015/11/27/06-58-54-609_250x250.jpg"
  },
];