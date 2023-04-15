import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'App/constants.dart';
import 'Presentation/Routes/routes.dart';
import 'Presentation/DependencyInjection/getit.dart';

Future<void> main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;
  setupGetIt(firstCamera);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: appTitle,
      theme: ThemeData(
        primarySwatch: primaryColor,
      ),
      routerDelegate: routes.routerDelegate,
      routeInformationParser: routes.routeInformationParser,
      routeInformationProvider: routes.routeInformationProvider,
    );
  }
}
