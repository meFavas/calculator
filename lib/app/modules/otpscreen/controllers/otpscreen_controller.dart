// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_calculator/app/consts/colors.dart';
import 'package:my_calculator/app/modules/dashboard/views/dashboard_view.dart';

class OtpscreenController extends GetxController {
  TextEditingController otpcontroller = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  void verifyOtp(String verificationId) async {
    String otp = otpcontroller.text.trim();
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otp,
    );

    try {
      await auth.signInWithCredential(credential);
      Get.snackbar("Success", "Phone number verified!",
          colorText: Colorconsts.mywhite);
      Get.to(DashboardView());
    } catch (e) {
      Get.snackbar("Error", "Invalid OTP");
    }
  }
}
