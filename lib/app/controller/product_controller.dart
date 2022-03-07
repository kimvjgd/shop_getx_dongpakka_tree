import 'package:get/get.dart';
import 'package:shop_getx_repeat_coding/app/data/model/product.dart';
import 'package:shop_getx_repeat_coding/app/data/provider/remote_services.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  RxList<Product> productList = <Product>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try{
      isLoading(true);
      var products = await RemoteServices.fetchProducts();
      if(products != []){
        productList.value = products;
      }
    }finally{
      isLoading(false);
    }
  }
}