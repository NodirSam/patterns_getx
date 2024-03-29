import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/instance_manager.dart';
import '../controllers/main_controller.dart';
import '../model/post_model.dart';
import '../views/item_main_post.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  static const String id = "main_page";

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  void initState() {
    super.initState();
    Get.find<MainController>().apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GetX"),
      ),
      body: Obx(
            () => Stack(
          children: [
            ListView.builder(
              itemCount: Get.find<MainController>().items.length,
              itemBuilder: (ctx, index) {
                Post post = Get.find<MainController>().items[index];
                return itemMainPost(Get.find<MainController>(), post );
              },
            ),
            Get.find<MainController>().isLoading.value
                ? const Center(
              child: CircularProgressIndicator(),
            )
                : const SizedBox.shrink(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }

// Widget itemOfPost(Post post) {
//   return Slidable(
//     startActionPane: ActionPane(
//       motion: const ScrollMotion(),
//       dismissible: DismissiblePane(onDismissed: () {}),
//       children: [
//         SlidableAction(
//           onPressed: (BuildContext context) {},
//           backgroundColor: Colors.green,
//           foregroundColor: Colors.white,
//           icon: Icons.edit,
//           label: "Update",
//         )
//       ],
//     ),
//     endActionPane: ActionPane(
//       motion: const ScrollMotion(),
//       children: [
//         SlidableAction(
//           // An action can be bigger than the others.
//           onPressed: (BuildContext context) {
//             _apiPostDelete(post);
//           },
//           backgroundColor: Colors.red,
//           foregroundColor: Colors.white,
//           icon: Icons.delete,
//           label: 'Delete',
//         ),
//       ],
//     ),
//     child: Container(
//       padding: const EdgeInsets.only(left: 20,right: 20, top: 20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             post.title.toUpperCase(),
//             style: const TextStyle(
//                 color: Colors.black),
//           ),
//           const SizedBox(
//             height: 5,
//           ),
//           Text(
//             post.body,
//             style: const TextStyle(
//                 color: Colors.black54),
//           ),
//         ],
//       ),
//     ),
//   );
// }
}