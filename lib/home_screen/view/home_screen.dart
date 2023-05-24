import 'package:e_commerce_app/cart_screen/view/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/utils.dart';
import '../controller/home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final HomeScreenController controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "Smart Phone",
                icon: Icon(Icons.smartphone),
              ),
              Tab(text: "Laptop", icon: Icon(Icons.laptop)),
              Tab(text: "Gadgets", icon: Icon(Icons.watch)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ProductView(
              data: controller.mobileData,
            ),
            ProductView(
              data: controller.laptopData,
            ),
            ProductView(
              data: controller.gadgetData,
            ),
          ],
        ),
        floatingActionButton: GestureDetector(
          onTap: (){
            Get.to(CartScreen(data: controller.addedData,));
          },
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Icon(
                Icons.shopping_bag,
                size: 40,
                color: Colors.purple,
              ),
              Obx(() => Positioned(
                    bottom: 30,
                    right: -6,
                    child: Text(
                      "${controller.addedData.length}",
                      style: TextStyle(fontSize: 25, color: Colors.purple),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
