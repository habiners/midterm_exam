import 'package:get/state_manager.dart';
import 'package:shopx/models/product.dart';
import 'package:shopx/services/remote_services.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  List<Product> productList = List<Product>().obs;

  @override
  void onInit() async {
    this.productList = await fetchProducts();
    super.onInit();
  }

  Future<List<Product>> fetchProducts() async {
    List<Product> products;
    // Queries
    try {
      return await RemoteServices.fetchProducts();
    } catch (e) {
      Get.snackbar("Error!", e.toString());
    }
    return products;
  }
}
