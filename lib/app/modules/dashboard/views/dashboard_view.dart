// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_calculator/app/consts/colors.dart';
import 'package:my_calculator/app/consts/widgets.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DashboardController dashcontroller = Get.put(DashboardController());

    return Scaffold(
      backgroundColor: Colorconsts.myblack,
      appBar: AppBar(
        leading: Themes.arrowback,
        title: Obx(() {
          return Text(
            "Hi ${dashcontroller.username.value}",
            style: Themes.heading1,
          );
        }),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            InkWell(
                onTap: () {
                  dashcontroller.calculator();
                },
                child: Themes.calcicon),
            Themes.width2,
            InkWell(
                onTap: () {
                  dashcontroller.expense();
                },
                child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colorconsts.myorange)),
                    child: Themes.ruppee))
          ],
        ),
      ),
    );
  }
}
