import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:riverpod_example/home/page/home_page.dart';
import 'package:riverpod_example/home/page/state_notifier_home_page.dart';

void main() {
  runApp(const ProviderScope(child: RiverpodExample()));
}

class RiverpodExample extends StatelessWidget {
  const RiverpodExample({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePageStateNotifier(),
    );
  }
}
