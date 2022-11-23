import 'package:flutter_test/flutter_test.dart';
import 'package:image_search/data/api.dart';
import 'package:image_search/model/photo.dart';
import 'package:image_search/ui/home_view_model.dart';

void main() {
  test('Stream 이 잘 동작해야 한다 ', () async {
    final viewModel = HomeViewModel(PixabayApi());

    await viewModel.fetch('apple');
    await viewModel.fetch('apple');


    expect(viewModel.photoStream, emitsInOrder([
      isA<List<Photo>>(),
      isA<List<Photo>>(),
    ]));
  });
}