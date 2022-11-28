import 'package:http/http.dart' as http;
import 'package:image_search/data/data_source/pixabay_api.dart';
import 'package:image_search/data/repository/photo_api_repository_impl.dart';
import 'package:image_search/domain/repository/photo_api_repository.dart';
import 'package:image_search/domain/usecase/get_photos_use_case.dart';
import 'package:image_search/presentation/home/home_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

// 1. provider 전체
List<SingleChildWidget> globalProviders = [
  ...independentProviders,
  ...dependentProviders,
  ...viewModels
];

// 2. 독립적인 개체
List<SingleChildWidget> independentProviders = [
  Provider<http.Client>(create: (context) => http.Client())
];

// 3. 2번에 의존성 있는 객체
List<SingleChildWidget> dependentProviders = [
  ProxyProvider<http.Client, PixabayApi>(
      update: (context, client, _) => PixabayApi(client)),
  ProxyProvider<PixabayApi, PhotoApiRepository>(
      update: (context, api, _) => PhotoApiRepositoryImpl(api)),
  ProxyProvider<PhotoApiRepository, GetPhotosUseCase>(
      update: (context, repository, _) => GetPhotosUseCase(repository)),
];

// 4. viewModels
List<SingleChildWidget> viewModels = [
  ChangeNotifierProvider<HomeViewModel>(
    create: (context) => HomeViewModel(context.read<GetPhotosUseCase>()),
  ),
];