import 'package:flutter/material.dart';
import '../../../App/auth_service.dart';
import '../../DependencyInjection/getit.dart';
import 'package:go_router/go_router.dart';

class ConfirmViewPage extends StatefulWidget {
  const ConfirmViewPage({Key? key}) : super(key: key);
 
 @override
  State<ConfirmViewPage> createState() => _ConfirmViewPageState();
}

class _ConfirmViewPageState extends State<ConfirmViewPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: OutlinedButton(
      onPressed: () => context.go('/photo'),
      child: const Text('Take another photo'),
    )));
  }
}
