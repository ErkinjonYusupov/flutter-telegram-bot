import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping_telegram_bot/stores/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const Spacer(),
                  const Text(
                    'App name',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: controller.name,
                    decoration: InputDecoration(
                        hintText: "Ismi",
                        
                        filled: true,
                        fillColor: Colors.white.withOpacity(.5),
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)))),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: controller.phone,
                    decoration: InputDecoration(
                        hintText: "Telefon raqami",
                        filled: true,
                        fillColor: Colors.white.withOpacity(.5),
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)))),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: controller.login,
                    decoration: InputDecoration(
                        hintText: "Login",
                        filled: true,
                        fillColor: Colors.white.withOpacity(.5),
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)))),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: controller.password,
                    decoration: InputDecoration(
                        hintText: "Parol",
                        filled: true,
                        fillColor: Colors.white.withOpacity(.5),
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)))),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                      width: double.maxFinite,
                      height: 60,
                      child: ElevatedButton(
                          onPressed: () {
                            controller.loginFunction();
                          }, child: const Text('Kirish'))),
                  const Spacer(),                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
