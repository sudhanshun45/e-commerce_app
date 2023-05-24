import 'package:e_commerce_app/home_screen/model/mobile_data_model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomeScreenController extends GetxController{

List<ProductDataModel> mobileData = ProductData().mobileData;
List<ProductDataModel> laptopData = ProductData().laptopData;
List<ProductDataModel> gadgetData = ProductData().gadgetData;

RxList addedData =[].obs;

addData(String name,String price, String image){
  addedData.add(ProductDataModel(image: image, name: name, price: price));
}

}