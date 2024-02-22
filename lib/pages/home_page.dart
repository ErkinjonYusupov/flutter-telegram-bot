import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shoping_telegram_bot/model/product_model.dart';
import 'package:shoping_telegram_bot/stores/product_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map user = GetStorage().read('user');

  ProductController controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user['name']),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart))
        ],
      ),
      body: ListView.builder(
          itemCount: controller.products.length,
          itemBuilder: (context, index) {
            var item = controller.products[index];
            return ProductItem(item: item, onTap:(){
              controller.add(item);
            });
          }),
    );
  }
}

class ProductItem extends StatelessWidget {
  ProductItem({super.key, required this.item, required this.onTap});
  ProductModel item;
  Function onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(item.title,
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
            Row(
              children: [
                Text(
                  item.price.toString(),
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
                IconButton(
                    onPressed: () {
                      onTap();
                    },
                    icon: const Icon(
                      Icons.add_circle_outline,
                      color: Colors.green,
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
