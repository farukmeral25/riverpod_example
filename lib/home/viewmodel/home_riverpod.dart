import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/home/data/manager/counter_manager.dart';
import 'package:riverpod_example/home/data/model/counter_model.dart';

final titleProvider = Provider<String>(
  (ref) => "Riverpod",
);

final titleStateNotifierProvider = Provider<String>(
  (ref) => "Riverpod State Notifier",
);

final descriptionProvider = Provider<String>(
  (ref) => "You have pushed the button this many times: ",
);

//Değişkenlik gösterecek veri.
final counterStateProvider = StateProvider<int>(
  (ref) {
    return 0;
  },
);

//!StateNotifierProvider
final counterNotifierProvider =
    StateNotifierProvider<CounterManager, CounterModel>(
  (ref) {
    return CounterManager();
  },
);

final isDoubleProvider = Provider<bool>(
  (ref) {
    //Eğer ilk açılış değeri önemli ise read ile kontrol edilmeli,
    //eğer anlık olarak takibi yapılacak ise watch kullanılmalıdır.
    CounterModel counterModel = ref.watch(counterNotifierProvider);

    // if (counterModel.counterValue % 2 == 0) {
    //   return true;
    // } else {
    //   return false;
    // }

    return counterModel.counterValue % 2 == 0;
  },
);
