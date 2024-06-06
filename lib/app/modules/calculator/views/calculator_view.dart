// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_constructors_in_immutables, sort_child_properties_last, unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:my_calculator/app/consts/colors.dart';
import 'package:my_calculator/app/consts/contant.dart';
import 'package:my_calculator/app/consts/widgets.dart';
import 'package:my_calculator/app/modules/calculator/controllers/calculator_controller.dart';

class CalculatorView extends GetView<CalculatorController> {
  @override
  Widget build(BuildContext context) {
    final CalculatorController calcontroller = Get.put(CalculatorController());

    return Scaffold(
        backgroundColor: Colorconsts.myblack,
        appBar: AppBar(
          leading: Themes.arrowback,
          backgroundColor: Colors.transparent,
          title: Text('Calculator', style: Themes.heading1),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Obx(() => Text(
                          calcontroller.display.value,
                          style: Themes.heading2,
                        )),
                    Obx(() => Text(
                          calcontroller.result.value,
                          style: Themes.heading1,
                        )),
                  ],
                ),
              ),
            ),
            Divider(),
            Expanded(
              child: GridView.builder(
                itemCount: Costants.numbers.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.15,
                    crossAxisCount: 4,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5),
                itemBuilder: (context, index) {
                  final res = Costants.numbers[index];

                  return InkWell(
                    onTap: () {
                      calcontroller.input(res);
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      child: Center(
                        child: Text(res, style: Themes.normal),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Costants.data.contains(res)
                              ? Colorconsts.myorange
                              : Colorconsts.mygrey),
                    ),
                  );
                },
              ),
            )
          ],
        ));
  }
}
