import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopx/controllers/product_controller.dart';
import 'package:shopx/views/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ProductController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
