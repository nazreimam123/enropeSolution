import 'package:enrope/utils/custom_app_bar.dart';
import 'package:enrope/view/count_page/count_page.dart';
import 'package:enrope/view/post/post_page.dart';
import 'package:enrope/view/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // home: Profile(),
      // home: CountPage(),
      home: PostPage(),
    );
  }
}

