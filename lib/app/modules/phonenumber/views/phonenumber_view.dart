// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_calculator/app/consts/colors.dart';
import 'package:my_calculator/app/consts/widgets.dart';

import '../controllers/phonenumber_controller.dart';

class PhonenumberView extends GetView<PhonenumberController> {
  const PhonenumberView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final PhonenumberController numbercontroller =
        Get.put(PhonenumberController());
    return Scaffold(
        backgroundColor: Colorconsts.myblack,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: numbercontroller.phnumberController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  prefixIcon: Themes.phone,
                  fillColor: Colorconsts.mygrey,
                  filled: true,
                  label: Text("Enter Your Number"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            Themes.height2,
            InkWell(
              onTap: () async {
                numbercontroller.numberverify();
              },
              child: Container(
                height: 60,
                width: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colorconsts.myorange),
                child: Center(
                  child: Text(
                    "Verify Your Number",
                    style: Themes.normal,
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
