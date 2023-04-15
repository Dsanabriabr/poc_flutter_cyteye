import 'package:flutter/cupertino.dart';
import 'package:poc_flutter_empty/Domain/DTOs/request_data.dart';
import 'package:poc_flutter_empty/Domain/Interfaces/UseCases/get_story_usecase_interface.dart';

import '../../Views/Home/home_viewmodel.dart';

class PhotoViewPageModel extends ChangeNotifier {
  final HomeViewModel homeViewModel;
  final GetStoryUseCaseInterface getStoryUseCase;

  String heroName = '';
  String villainName = '';
  String contextStory = '';
  String moralStory = '';

  PhotoViewPageModel(this.homeViewModel, this.getStoryUseCase);

  void getNewStory() async {
    var requestData = RequestData(heroName, villainName, contextStory, moralStory);
    final storyData = await getStoryUseCase.getStoryData(requestData);
    storyData.fold((success) {
      print(success);
    }, (failure) {
      throw Exception("PhotoViewPageModel locationUseCase Fail for $failure");
    });
    notifyListeners();
  }
}
