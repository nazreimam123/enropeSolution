import 'package:enrope/controller/post_controller.dart';
import 'package:enrope/utils/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PostController());

    return Scaffold(
      appBar: const CustomAppBar(title: 'Post'),
      body: Obx(() {
        if (controller.isLoading.value)
          return const Center(child: CircularProgressIndicator());
        else {
          return RefreshIndicator(
            onRefresh: controller.fetchPosts,
            child: ListView.builder(
              itemCount: controller.posts.length,
              itemBuilder: (_, i) => ListTile(
                title: Text(controller.posts[i].title.toString()),
                subtitle: Text(controller.posts[i].body.toString()),
              ),
            ),
          );
        }
      }),
    );
  }
}
