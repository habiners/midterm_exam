import 'package:get/state_manager.dart';
import 'package:shopx/models/product.dart';
import 'package:shopx/services/remote_services.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController instance = Get.find();

  RxBool isLoading = true.obs;
  List<Product> productList = <Product>[].obs;

  @override
  void onInit() async {
    super.onInit();
    this.productList = await fetchProducts();
    this.isLoading.value = false;
  }

  Future<List<Product>> fetchProducts() async {
    List<Product> products = [];
    try {
      return await RemoteServices.fetchProducts();
    } catch (e) {
      print(e.toString());
      Get.snackbar("Error querying for products!", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
    return products;
  }
}
