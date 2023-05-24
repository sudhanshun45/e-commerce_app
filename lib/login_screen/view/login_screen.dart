import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../controller/login_screen_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final LoginScreenController controller = Get.put(LoginScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Image.asset("assets/images/logo.png"),
          Container(
            height: Get.height * 0.07,
            width: Get.width * 0.8,
            padding: const EdgeInsets.only(left: 0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.purple, width: 4),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: controller.numberController,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                fontSize: 20,
              ),
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter Mobile Number",
                  prefixIcon: Icon(
                    Icons.phone,
                    color: Colors.purple,
                  ),
                  hintStyle: TextStyle(
                    fontSize: 20,
                  )),
            ),
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          Obx(() => controller.verificationIds.value.isEmpty
              ? GestureDetector(
                  onTap: () {
                    controller.verifyNumber(controller.numberController.text);
                  },
                  child: Container(
                    height: Get.height * 0.07,
                    width: Get.width * 0.5,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                      child: Text(
                        "Send OTP",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                )
              : Container(
                  height: Get.height * 0.07,
                  width: Get.width * 0.8,
                  padding: const EdgeInsets.only(left: 0),
                  child: PinCodeTextField(
                    appContext: context,
                    controller: controller.otpController,
                    pastedTextStyle:const TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                    ),
                    length: 6,
                    enablePinAutofill: true,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.purple,
                    ),
                    animationType: AnimationType.fade,
                    onChanged: (String value) {},
                  ),
                )),
          SizedBox(height:Get.height*0.03),
          Obx(()=>Visibility(
            visible: controller.verificationIds.value.isNotEmpty,
            child: GestureDetector(
              onTap: () {
                controller.confirmOTP(controller.otpController.text, controller.verificationIds.value);
              },
              child: Container(
                height: Get.height * 0.07,
                width: Get.width * 0.5,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Center(
                  child: Text(
                    "Confirm OTP",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ))
        ],
      )),
    );
  }
}
