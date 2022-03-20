import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/home/data/model/counter_model.dart';
import 'package:riverpod_example/home/viewmodel/home_riverpod.dart';

class HomePageStateNotifier extends StatelessWidget {
  const HomePageStateNotifier({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Consumer(
        builder: (context, ref, child) {
          String title = ref.watch(titleStateNotifierProvider);
          return Text(title);
        },
      )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            TextWidget(),
            CounterText(),
            IsDoubleWidget(),
          ],
        ),
      ),
      floatingActionButton: const FloatingActionButtonWidget(),
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
    CounterModel _counter = ref.watch(counterNotifierProvider);
    return Text(
      _counter.counterValue.toString(),
      style: Theme.of(context).textTheme.headline4,
    );
  }
}

class IsDoubleWidget extends ConsumerWidget {
  const IsDoubleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isDouble = ref.watch(isDoubleProvider);
    return Text(isDouble ? "Even" : "Odd");
  }
}

class FloatingActionButtonWidget extends ConsumerWidget {
  const FloatingActionButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () {
        //ref.read(counterNotifierProvider) bize CounterModel dönüyor.
        //Methodlar CounterManager sınıfında
        //Counter Manager'a erişmek için notifier kullanılır.
        ref.read(counterNotifierProvider.notifier).increase();
      },
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}
