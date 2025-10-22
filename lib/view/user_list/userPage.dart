import 'dart:developer';

import 'package:enrope/controller/user/userController.dart';
import 'package:enrope/model/userModel/userModel.dart';
import 'package:enrope/services/userAPi/userApi.dart';
import 'package:enrope/utils/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class userPage extends StatefulWidget {
  const userPage({super.key});

  @override
  State<userPage> createState() => _userPageState();
}

// ignore: camel_case_types
class _userPageState extends State<userPage> {
  final Usercontroller controller = Get.put(Usercontroller());

  // final TextEditingController name=TextEditingController();
  @override
  Widget build(BuildContext context) {
    // print(controller.users.length);
    return Scaffold(
      appBar: CustomAppBar(title: 'User List'),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.users.isEmpty) {
          return const Center(
            child: Text(
              'No Data available',
              style: TextStyle(color: Colors.black),
            ),
          );
        }
        return RefreshIndicator(
          onRefresh: controller.fetchUsers,
          child: ListView.builder(
            itemCount: controller.users.length,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.white,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      '${controller.users[index].avatar}',
                    ),
                    // child: Image.network('${controller.users[index].avatar}')
                    // child: Text(controller.users[index].id.toString()),
                  ),
                  title: Row(
                    children: [
                      Text(controller.users[index].name.toString()),
                      // SizedBox(width: 5),
                      Spacer(),
                      // Text(controller.users[index].id.toString()),
                    ],
                  ),
                  subtitle: Text(controller.users[index].createdAt.toString()),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.edit, color: Colors.green),
                        ),
                        IconButton(
                          onPressed: () {
                            controller.deleteUser(
                              controller.users[index].id.toString(),
                              controller.users[index].name.toString(),
                            );
                            log('${controller.users[index].id}');
                          },
                          icon: Icon(Icons.delete, color: Colors.red),
                        ),
                        // Text(controller.users[index].id.toString()),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showdformdialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showdformdialog(BuildContext context) {
    final TextEditingController name = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add user'),
          content: TextFormField(
            controller: name,
            decoration: InputDecoration(hintText: "Enter Name"),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                Get.back();
                await controller.addUser(name.text);
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }
}

// void _showdformdialog(BuildContext context, ) {
//   final TextEditingController name = TextEditingController();
//   showDialog(
//     context: context,
//     builder: (context) {
//       return AlertDialog(
//         title: Text('Add user'),
//         // backgroundColor: Colors.pink,
//         content: TextFormField(
//           controller: name,
//           decoration: InputDecoration(hintText: "Enter Name"),
//         ),
//         actions: [
//           ElevatedButton(
//             onPressed: () {
//               Get.back();
//             },
//             child: Text('Cancel'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               // Userapi().adduser(name.text.toString());
//               // Get.back();

//             },
//             child: Text('Submit'),
//           ),
//         ],
//       );
//     },
//   );
// }
