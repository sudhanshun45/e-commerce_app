class ProductDataModel {
  final String image;
  final String name;
  final String price;

  ProductDataModel(
      {required this.image, required this.name, required this.price});
}

class ProductData{

   List<ProductDataModel> mobileData =[
    ProductDataModel(image: "assets/images/z4.png", name: "Samsung z4", price: "74000 INR"),
    ProductDataModel(image: "assets/images/realme_c11.png", name: "Realme C11", price: "11000 INR"),
    ProductDataModel(image: "assets/images/oppo.png", name: "Oppo", price: "34000 INR"),
    ProductDataModel(image: "assets/images/iphone_14.png", name: "Apple iPhone 14 Pro", price: "120000 INR"),
  ];

   List<ProductDataModel> laptopData =[
     ProductDataModel(image: "assets/images/hp.png", name: "HP Pavillion 14", price: "70000 INR"),
     ProductDataModel(image: "assets/images/dell.png", name: "Dell latitude", price: "54000 INR"),
     ProductDataModel(image: "assets/images/asus.png", name: "Asus", price: "65000 INR"),
     ProductDataModel(image: "assets/images/lenovo.png", name: "Lenovo Ideapad", price: "40000 INR"),
   ];

   List<ProductDataModel> gadgetData =[
     ProductDataModel(image: "assets/images/boat.png", name: "Boat Wave", price: "1500 INR"),
     ProductDataModel(image: "assets/images/samsung_watch.jpg", name: "Samsung Smartwatch", price: "39000 INR"),
     ProductDataModel(image: "assets/images/airpods.png", name: "Apple Airpods", price: "12000 INR"),
     ProductDataModel(image: "assets/images/headphone.jpg", name: "Marshall Headphone", price: "12000 INR"),
   ];

}


