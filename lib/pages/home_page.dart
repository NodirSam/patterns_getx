import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/instance_manager.dart';
import '../controllers/home_controller.dart';
import '../model/post_model.dart';
import '../services/http_service.dart';
import '../views/item_home_post.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
 
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    _controller.apiPostList();
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
                itemCount: _controller.items.length,
                itemBuilder: (ctx, index) {
                  Post post = _controller.items[index];
                  return itemHomePost(_controller, post );
                },
              ),
              _controller.isLoading.value
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
