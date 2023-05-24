import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../home_screen/view/home_screen.dart';

class LoginScreenController extends GetxController {
  TextEditingController numberController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  RxString verificationIds ="".obs;

  sendOTP(String number) async {
   try{
     FirebaseAuth auth = FirebaseAuth.instance;

     await auth.verifyPhoneNumber(
       phoneNumber: "+91${number.trim()}",
         verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async{
           await auth.signInWithCredential(phoneAuthCredential);
         },
         verificationFailed: (error) {
           throw Exception(error.message);
         },
         codeSent: (verificationId, forceResendingToken) {
         verificationIds.value = verificationId;
         },
         codeAutoRetrievalTimeout: (String verificationId) {});
   }on FirebaseAuthException catch(e) {
     Get.showSnackbar("${e.message}" as GetSnackBar);
   }
  }

  verifyNumber(String number) {
    if (number.isNotEmpty) {
      sendOTP(number);
    } else {
      Get.snackbar("Invalid Number", "Please Enter a valid number");
    }
  }

  confirmOTP(String otp,String verificationID)async{
    if(otp.isEmpty || otp.length<6 ){
      Get.snackbar("Invalid OTP","Please Enter a valid OTP");
    } else{
      try{
        FirebaseAuth auth = FirebaseAuth.instance;
        PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationID, smsCode: otp);
        UserCredential user = await  auth.signInWithCredential(credential);
        Get.to( HomeScreen());
      }on FirebaseAuthException catch(e){
        Get.snackbar("Invalid OTP", "Please Enter a valid OTP");
      }
    }
  }
}
