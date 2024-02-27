import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping_telegram_bot/stores/cart_controller.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  CartController controller = Get.put(CartController());
  @override
  void initState() {
    controller.fetchCartProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(title: const Text("Savatcha")),
          bottomNavigationBar:
          controller.cartProducts.isEmpty ? const SizedBox() :
           Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child:  Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                 Text("Mahsulot jami narxi: ${controller.totolSumma()} so'm"),
                ElevatedButton(onPressed: (){
                  controller.ordered();
                }, child: const Text("Buyurtma berish"))
              ],
            ),
          ),
          body: ListView.builder(
            itemCount: controller.cartProducts.length,
            itemBuilder: (context, index){
              var item = controller.cartProducts[index];
              return  CartProduct(
                title:item['title'],
                price:item['price'],
                count: item['count'],
                add:(){
                  controller.add(item['id']);
                },
                remove:(){
                  controller.remove(item['id']);
                },
              );
          }),
          
        );
      },
    );
  }
}

class CartProduct extends StatelessWidget {
  CartProduct({
    super.key,
    required this.count,
    required this.price,
    required this.title,
    required this.add,
    required this.remove,
  });
  final String title;
  final int price;
  final int count;
  Function add;
  Function remove;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 16),
                ),
                Text.rich(TextSpan(children: [
                  TextSpan(
                      text: price.toString(),
                      style: const TextStyle(fontWeight: FontWeight.w600)),
                  const TextSpan(text: " so'm"),
                ]))
              ],
            ),
            const Spacer(),
            IconButton(
                onPressed: () {
                  remove();
                },
                icon: const Icon(
                  Icons.remove_circle_outline,
                  color: Colors.red,
                )),
             Text(count.toString()),
            IconButton(
                onPressed: () {add();},
                icon: const Icon(
                  Icons.add_circle,
                  color: Colors.green,
                )),
          ],
        ),
      ),
    );
  }
}
