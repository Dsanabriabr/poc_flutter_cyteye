import 'package:flutter/material.dart';
import '../../../App/constants.dart';
import '../../Views/Home/home_view.dart';
import 'photo_viewpagemodel.dart';

class PhotoViewPage extends StatefulWidget {
  final PhotoViewPageModel viewModel;
  const PhotoViewPage({Key? key, required this.viewModel}) : super(key: key);

  @override
  State<PhotoViewPage> createState() => _PhotoViewPageState();
}

class _PhotoViewPageState extends State<PhotoViewPage> with HomeViewDelegate {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle),
      ),
      body: HomeView(viewModel: widget.viewModel.homeViewModel, delegate: this),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.viewModel.getNewStory();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  showAlertDialog(BuildContext context, String alertText) {
    AlertDialog alerta = AlertDialog(
      title: const Text("Alerta"),
      content: Text(alertText),
      actions: [
        CloseButton(onPressed: () {}),
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }

  // HomeViewDelegate
  @override
  void homeViewFormCompleted(String heroName, String villainName, String contextStory) {
    widget.viewModel.heroName = heroName;
    widget.viewModel.villainName = villainName;
    widget.viewModel.contextStory = contextStory;
    widget.viewModel.moralStory = "never lie";
  }
}