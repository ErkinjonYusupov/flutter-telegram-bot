import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartController extends GetxController {
  GetStorage base = GetStorage();
  List cartProducts = [];

  fetchCartProducts() {
    cartProducts = base.read('cart-product') ?? [];
    totolSumma();
    update();
  }

  updateBase() {
    base.write('cart-product', cartProducts);
  }

  add(int id) {
    var index = cartProducts.indexWhere((el) => el['id'] == id);
    if (index > -1) {
      cartProducts[index]['count']++;
      fetchCartProducts();
      updateBase();
    }
  }

  remove(int id) {
    var index = cartProducts.indexWhere((el) => el['id'] == id);
    if (index > -1) {
      if (cartProducts[index]['count'] == 1) {
        cartProducts.removeAt(index);
      } else {
        cartProducts[index]['count']--;
      }
      fetchCartProducts();
      updateBase();
    }
  }

  int totolSumma() {
    int summa = 0;
    for (var el in cartProducts) {
      summa = el['price'] * el['count'];
    }
    return summa;
  }

//token 7179599189:AAEyoSeGQTEGLxisaKo41tPOl89mK4M4a24

//let url = `https://api.telegram.org/bot` + token + `/sendMessage?chat_id=-533469967&text=`

// let message = local_data.reduce((acc, ce) =>
//         acc + ce.title + "\r\t" + ce.price + "\r\t"+"x" + ce.count + "\r\t" + ce.count * ce.price + '\r\n', '')



  Dio dio = Dio();
  ordered() async {
    var token = '7179599189:AAEyoSeGQTEGLxisaKo41tPOl89mK4M4a24';
    try {
      await dio.post(
          'https://api.telegram.org/bot$token/sendMessage?chat_id=141523108&text=$cartProducts');
          base.remove('cart-product');
          fetchCartProducts();
    } catch (err) {
      print(err);
    }
  }
}
