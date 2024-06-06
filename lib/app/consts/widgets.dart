// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:my_calculator/app/consts/colors.dart';

class Themes {
  static const TextStyle heading1 = TextStyle(
      color: Colorconsts.mywhite, fontWeight: FontWeight.bold, fontSize: 32);
  static const TextStyle thin = TextStyle(
      color: Colorconsts.myblack, fontWeight: FontWeight.w300, fontSize: 24);
  static const TextStyle headnormal = TextStyle(
      color: Colorconsts.myblack, fontWeight: FontWeight.w600, fontSize: 25);
  static const TextStyle headingblack = TextStyle(
      color: Colorconsts.myblack, fontWeight: FontWeight.bold, fontSize: 32);
  static const TextStyle heading2 =
      TextStyle(fontSize: 48, color: Colorconsts.mywhite);
  static const TextStyle normal =
      TextStyle(fontSize: 24, color: Colorconsts.myblack);
  static const TextStyle normal2 =
      TextStyle(fontSize: 24, color: Colorconsts.mywhite);
  static const SizedBox height1 = SizedBox(height: 10);
  static const SizedBox height2 = SizedBox(height: 20);
  static const SizedBox height3 = SizedBox(height: 30);
  static const SizedBox height4 = SizedBox(height: 40);
  static const SizedBox height5 = SizedBox(height: 50);
  static const SizedBox width1 = SizedBox(width: 10);
  static const SizedBox width2 = SizedBox(width: 20);
  static const SizedBox width3 = SizedBox(width: 30);
  static const SizedBox width4 = SizedBox(width: 40);
  static const SizedBox width5 = SizedBox(width: 50);
  static IconButton arrowback = IconButton(
      onPressed: () {
        Get.back();
      },
      icon: Icon(Icons.arrow_back, color: Colorconsts.mywhite));
  static const Icon ruppee =
      Icon(Icons.currency_rupee_sharp, color: Colorconsts.myorange, size: 30);
  static const Icon calcicon = Icon(
    Icons.calculate,
    color: Colorconsts.myorange,
    size: 60,
  );
  static const Icon usericon = Icon(Icons.person);
  static const Icon passicon = Icon(Icons.lock);
  static const Icon plusicon = Icon(Icons.add);
  static const Icon deleteicon = Icon(Icons.delete);
  static const Icon phone = Icon(Icons.phone);
}
