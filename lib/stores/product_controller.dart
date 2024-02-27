import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shoping_telegram_bot/database/products.dart';
import 'package:shoping_telegram_bot/model/product_model.dart';

class ProductController extends GetxController {
  List<ProductModel> products = productFromModel(AppDatabse.products);
  GetStorage base = GetStorage();
  List cartProducts = [];

  fetchCartProduct() {
    cartProducts = base.read('cart-product') ?? [];
  }

  add(ProductModel product) async {
    await fetchCartProduct();
    var index =
        cartProducts.indexWhere((element) => element['id'] == product.id);
    if (index > -1) {
      cartProducts[index]['count']++;
    } else {
      cartProducts.add({
        "id": product.id,
        "title": product.title,
        "price": product.price,
        "count": 1
      });
    }
    base.write('cart-product', cartProducts);
    Get.snackbar("Bajarildi", "Mahsulaot qo'shildi",
        duration: const Duration(milliseconds: 800));
  }
}
