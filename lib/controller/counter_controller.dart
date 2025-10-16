import 'package:get/get.dart';

class CounterController extends GetxController {
  RxInt count = 0.obs;

  void increment() {
    count.value++;
  }

  void decrement() {
    if (count.value <= 0) {
    } else {
      count.value--;
    }
  }
}
