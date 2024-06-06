// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unused_element, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:my_calculator/app/consts/colors.dart';
import 'package:my_calculator/app/consts/widgets.dart';

import '../controllers/expense_controller.dart';

class ExpenseView extends GetView<ExpenseController> {
  const ExpenseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ExpenseController expenseController = Get.put(ExpenseController());
    return Scaffold(
      backgroundColor: Colorconsts.myblack,
      appBar: AppBar(
          leading: Themes.arrowback,
          backgroundColor: Colors.transparent,
          title: Text(
            "Expence",
            style: Themes.heading1,
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colorconsts.myorange,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colorconsts.mywhite,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style: Themes.headingblack,
                    ),
                    Obx(
                      () => Text(
                        "₹${expenseController.expenselist.fold(0, (sum, item) => sum + int.parse(item['Amount']))}",
                        style: Themes.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Themes.height1,
            Text("Your Expences", style: Themes.normal2),
            Themes.height1,
            Expanded(
                child: Obx(
              () => ListView.separated(
                  itemBuilder: (context, index) => Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colorconsts.mygrey),
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    expenseController.expenselist[index]["name"]
                                        .toString(),
                                    style: Themes.headnormal,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        expenseController.deleted(index);
                                      },
                                      child: Themes.deleteicon)
                                ],
                              ),
                              Text(
                                "₹${expenseController.expenselist[index]["Amount"].toString()}",
                                style: Themes.thin,
                              )
                            ],
                          ),
                        ),
                      ),
                  separatorBuilder: (context, index) => Themes.height1,
                  itemCount: expenseController.expenselist.length),
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: Colorconsts.myorange,
              title: Column(
                children: [
                  TextFormField(
                    autofocus: true,
                    controller: expenseController.namecontroller,
                    decoration: InputDecoration(
                      fillColor: Colorconsts.mygrey,
                      filled: true,
                      label: Text("Name"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  Themes.height1,
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: expenseController.Amountcontroller,
                    decoration: InputDecoration(
                      fillColor: Colorconsts.mygrey,
                      filled: true,
                      label: Text("Amount"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  Themes.height1,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Get.back();
                          expenseController.clearall();
                        },
                        child: Text("Cancel"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          expenseController.added();
                          Get.back();
                          expenseController.clearall();
                        },
                        child: Text("Add"),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
        child: Themes.plusicon,
      ),
    );
  }
}
