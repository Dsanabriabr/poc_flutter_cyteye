import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'home_viewmodel.dart';

abstract class HomeViewDelegate {
  void homeViewFormCompleted(String heroName, String villainName, String historyContext);
}

class HomeView extends StatefulWidget {
  final HomeViewModel viewModel;
  final HomeViewDelegate delegate;
  const HomeView({Key? key, required this.viewModel, required this.delegate})
      : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String _picture = '';


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 16),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Instruction',
                  labelText: 'Click the button below to report accidents include potholes, powerlines and dumping.',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
        
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    homeViewFormCompleted();
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')));
                  }
                },
                child: const Text('Submit'),
              )
            ],
          ),
        ),
      ),
    );
  }


//HomeViewDelegate
  void homeViewFormCompleted() {
    widget.delegate.homeViewFormCompleted(_heroName, _villainName, _historyContexts[_currentIndex]);
  }
}
