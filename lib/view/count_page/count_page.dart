import 'dart:developer';

import 'package:enrope/controller/counter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CountPage extends StatefulWidget {
  const CountPage({super.key});

  @override
  State<CountPage> createState() => _CountPageState();
}

class _CountPageState extends State<CountPage> {
  final controller = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    log('build');
    return Scaffold(
      appBar: AppBar(title: const Text('Counter'), centerTitle: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Obx(() => Text(controller.count.value.toString()))),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () {
              controller.increment();
            },
            child: Text('Add'),
          ),
          FloatingActionButton(
            onPressed: () {
              controller.decrement();
            },
            child: Text('Minus'),
          ),
        ],
      ),
    );
  }
}
