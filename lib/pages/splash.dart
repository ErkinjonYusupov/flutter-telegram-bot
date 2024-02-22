import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shoping_telegram_bot/pages/home_page.dart';
import 'package:shoping_telegram_bot/pages/login_page.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  init() async {
    var user = await GetStorage().read('user');
    await Future.delayed(const Duration(seconds: 2));
    if (user != null) {
      Get.off(() => const HomePage());
    } else {
      Get.off(() => const LoginPage());
    }
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Hush kelibsiz"),
      ),
    );
  }
}
