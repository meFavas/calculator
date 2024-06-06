// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:my_calculator/app/modules/calculator/views/calculator_view.dart';
import 'package:my_calculator/app/modules/expense/views/expense_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardController extends GetxController {
  var username = "".obs;

  @override
  void onInit() {
    super.onInit();
    showname();
  }

  void calculator() {
    Get.to(CalculatorView());
  }
  void expense(){
    Get.to(ExpenseView());
  }

  void showname() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    username.value = prefs.getString('name') ?? 'User';
  }
}
