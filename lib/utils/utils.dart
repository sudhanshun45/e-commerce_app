import 'package:e_commerce_app/home_screen/controller/home_screen_controller.dart';
import 'package:e_commerce_app/home_screen/model/mobile_data_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductView extends StatelessWidget {
   ProductView({
    super.key,
    required this.data,
  });

  final List<ProductDataModel> data;

  final HomeScreenController controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.8,
      padding:const EdgeInsets.only(top: 2),
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 8,
          ),
          itemCount: data.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white70,
                  border: Border.all(
                    color: Colors.purple,
                    width: 1,
                  )),
              child: Column(
                children: [
                  Image.asset(
                    data[index].image,
                    height: Get.height*0.16,
                  ),
                   Text(
                    data[index].name,
                    style:const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  GestureDetector(
                    onTap: (){
                      controller.addData(data[index].name,data[index].price,data[index].image);
                    },
                    child: const Text(
                      "Add to Cart",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.purple),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
