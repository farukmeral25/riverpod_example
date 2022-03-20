import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/home/data/model/counter_model.dart';

class CounterManager extends StateNotifier<CounterModel> {
  CounterManager() : super(CounterModel(counterValue: 0));

  void increase() {
    int value = state.counterValue;
    state = CounterModel(counterValue: ++value);
  }

  void decrease() {
    int value = state.counterValue;
    state = CounterModel(counterValue: --value);
  }
}
