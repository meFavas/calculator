import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/homescreen.controller.dart';

class HomescreenScreen extends GetView<HomescreenController> {
  const HomescreenScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomescreenScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'HomescreenScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
