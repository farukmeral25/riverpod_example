import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/home/viewmodel/home_riverpod.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Consumer(
        builder: (context, ref, child) {
          String title = ref.watch(titleProvider);
          return Text(title);
        },
      )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:const  <Widget>[
            TextWidget(),
            CounterText(),
          ],
        ),
      ),
      floatingActionButton:const FloatingActionButtonWidget(),
    );
  }
}

class TextWidget extends ConsumerWidget {
  const TextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String description = ref.watch(descriptionProvider);
    return Text(description);
  }
}

class CounterText extends ConsumerWidget {
  const CounterText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int _counter = ref.watch(counterStateProvider);
    return Text(
      _counter.toString(),
      style: Theme.of(context).textTheme.headline4,
    );
  }
}

class FloatingActionButtonWidget extends ConsumerWidget {
  const FloatingActionButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return  FloatingActionButton(
        onPressed: () {
          ref.read(counterStateProvider.state).state++;
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      );
  }
}
