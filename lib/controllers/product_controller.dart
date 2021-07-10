import 'package:get/state_manager.dart';
import 'package:shopx/models/product.dart';
import 'package:shopx/services/remote_services.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController instance = Get.find();

  var isLoading = true.obs;
  List<Product> productList = List<Product>().obs;

  @override
  void onInit() async {
    super.onInit();
    this.productList = await fetchProducts();
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
