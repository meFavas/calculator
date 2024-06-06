import 'package:get/get.dart';

import '../../../../presentation/homescreen/controllers/homescreen.controller.dart';

class HomescreenControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomescreenController>(
      () => HomescreenController(),
    );
  }
}
