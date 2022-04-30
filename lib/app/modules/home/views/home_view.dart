import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transisi_app/app/modules/home/views/component/body.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transisi App'),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}
