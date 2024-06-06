// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_calculator/app/consts/colors.dart';
import 'package:my_calculator/app/modules/otpscreen/views/otpscreen_view.dart';

class PhonenumberController extends GetxController {
  TextEditingController phnumberController = TextEditingController();

  Future<void> numberverify() async {
    String phoneNumber = phnumberController.text.trim();
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance.signInWithCredential(credential);
        Get.to(OtpscreenView());
      },
      verificationFailed: (FirebaseAuthException e) {
        Get.snackbar("Error", "Invalid PhoneNumber",
            colorText: Colorconsts.mywhite);
      },
      codeSent: (String verificationId, int? resendToken) {
        Get.to(OtpscreenView(), arguments: verificationId);
      
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
    update();
  }
}
