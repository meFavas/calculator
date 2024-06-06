// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExpenseController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    loadExpenses();
  }

  TextEditingController namecontroller = TextEditingController();
  TextEditingController Amountcontroller = TextEditingController();
  var expenselist = [].obs;

  void added() {
    if (namecontroller.text.isNotEmpty && Amountcontroller.text.isNotEmpty) {
      expenselist.add({
        "name": namecontroller.text,
        "Amount": Amountcontroller.text,
      });
      saveExpenses();
    }
  }

  void clearall() {
    namecontroller.clear();
    Amountcontroller.clear();
    update();
  }

  void deleted(index) {
    expenselist.removeAt(index);
    update();
  }

  void saveExpenses() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> names = expenselist.map((e) => e['name'].toString()).toList();
    List<String> amounts =
        expenselist.map((e) => e['Amount'].toString()).toList();

    await prefs.setStringList('expenseNames', names);
    await prefs.setStringList('expenseAmounts', amounts);
  }

  void loadExpenses() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? names = prefs.getStringList('expenseNames');
    List<String>? amounts = prefs.getStringList('expenseAmounts');

    if (names != null && amounts != null && names.length == amounts.length) {
      expenselist.value = List.generate(names.length, (index) {
        return {
          "name": names[index],
          "Amount": amounts[index],
        };
      });
    }
  }
}
