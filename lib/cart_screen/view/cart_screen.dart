import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home_screen/model/mobile_data_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key, required this.data}) : super(key: key);

  final List data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
         Obx(() =>  Expanded(
           flex: 9,
           child: ListView.separated(
             separatorBuilder: (context, index) => const SizedBox(
               height: 20,
             ),
             itemBuilder: (context, index) => Container(
               padding: const EdgeInsets.all(5),
               margin: const EdgeInsets.all(10),
               decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(10),
                   border: Border.all(color: Colors.purple, width: 2)),
               height: Get.height * 0.13,
               child: Column(
                 children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text(
                         "${data[index].name}",
                         style: TextStyle(
                             fontWeight: FontWeight.w600, fontSize: 16),
                       ),
                       Text(
                         "${data[index].price}",
                         style: TextStyle(
                             fontWeight: FontWeight.w600, fontSize: 16),
                       )
                     ],
                   ),
                   SizedBox(
                     height: 20,
                   ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.end,
                     children: [
                       GestureDetector(
                         onTap: (){
                           data.removeAt(index);
                         },
                         child: Text(
                           "Remove",
                           style: TextStyle(
                               fontWeight: FontWeight.w600,
                               fontSize: 16,
                               color: Colors.redAccent),
                         ),
                       )
                     ],
                   )
                 ],
               ),
             ),
             itemCount: data.length,
           ),
         )),
          Expanded(
              child: Container(
            height: Get.height * 0.1,
            width: Get.width,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.purple,
                width: 2,
              ),
            ),
            child: GestureDetector(
              onTap: () {
                if(data.isEmpty){
                  Get.defaultDialog(
                    title: "Oops!",
                    content:const  Text("You don't have any item in your cart",
                        textAlign: TextAlign.center),
                  );
                }else{
                  Get.defaultDialog(
                    title: "Hurray!",
                    content:const  Text("Your order has been placed succesfully",
                        textAlign: TextAlign.center),
                  );
                }
              },
              child: const Center(
                child: Text(
                  "DONE",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
