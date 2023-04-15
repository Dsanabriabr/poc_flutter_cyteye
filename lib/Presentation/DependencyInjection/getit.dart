import 'package:camera/camera.dart';
import 'package:poc_flutter_empty/Domain/Interfaces/UseCases/get_story_usecase_interface.dart';

import '../../App/auth_service.dart';
import '../../Data/Providers/network_provider.dart';
import '../../Data/Repositories/network_repository.dart';
import '../../Domain/Interfaces/Repositories/network_repository_interface.dart';
import '../../Domain/UseCases/get_story_usecase.dart';
import '../../Presentation/Pages/Home/home_viewpage.dart';
import '../../Presentation/Pages/Home/home_viewpagemodel.dart';
import '../../Presentation/Pages/Photo/photo_viewpage.dart';
import '../../Presentation/Pages/Photo/photo_viewpagemodel.dart';
import '../../Presentation/Pages/Confirm/confirm_viewpage.dart';
import '../../Presentation/Pages/Confirm/confirm_viewpagemodel.dart';
import '../../Presentation/Views/Home/home_viewmodel.dart';
import 'package:get_it/get_it.dart';

import '../Views/Photo/photo_viewmodel.dart';

final getIt = GetIt.instance;

void setupGetIt(CameraDescription camera) {
  
  getIt.registerSingleton<AuthService>(AuthService());

  getIt.registerFactory<ConfirmViewPage>(() => const ConfirmViewPage());


  getIt.registerFactory<HomeViewModel>(() => HomeViewModel());
  getIt.registerFactory<HomeViewPageModel>(() => HomeViewPageModel(
      getIt.get<HomeViewModel>(), getIt.get<GetStoryUseCaseInterface>()));
  getIt.registerFactory<HomeViewPage>(
      () => HomeViewPage(viewModel: getIt.get<HomeViewPageModel>()));

  getIt.registerFactory<NetworkProvider>(() => NetworkProvider());
  getIt.registerFactory<NetworkRepositoryInterface>(() => NetworkRepository(getIt.get<NetworkProvider>()));
  getIt.registerFactory<GetStoryUseCaseInterface>(() => GetStoryUseCase(getIt.get<NetworkRepositoryInterface>()));

getIt.registerFactory<PhotoViewModel>(() => PhotoViewModel());
  getIt.registerFactory<PhotoViewPageModel>(() => PhotoViewPageModel(
      getIt.get<HomeViewModel>(), getIt.get<GetStoryUseCaseInterface>()));
  getIt.registerFactory<PhotoViewPage>(
      () => PhotoViewPage(viewModel: getIt.get<PhotoViewPageModel>(), camera: camera,));

}