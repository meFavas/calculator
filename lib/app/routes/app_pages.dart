import 'package:get/get.dart';

import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/expense/bindings/expense_binding.dart';
import '../modules/expense/views/expense_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/otpscreen/bindings/otpscreen_binding.dart';
import '../modules/otpscreen/views/otpscreen_view.dart';
import '../modules/phonenumber/bindings/phonenumber_binding.dart';
import '../modules/phonenumber/views/phonenumber_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.EXPENSE,
      page: () => const ExpenseView(),
      binding: ExpenseBinding(),
    ),
    GetPage(
      name: _Paths.PHONENUMBER,
      page: () => const PhonenumberView(),
      binding: PhonenumberBinding(),
    ),
    GetPage(
      name: _Paths.OTPSCREEN,
      page: () => const OtpscreenView(),
      binding: OtpscreenBinding(),
    ),
  ];
}
