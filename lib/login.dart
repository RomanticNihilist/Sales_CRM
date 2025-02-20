import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Controllers/auth_controller.dart';
import 'Controllers/language_controller.dart';
import 'components/custom_input.dart';

class LoginPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthController loginController = Get.put(AuthController());
  final LanguageController languageController = Get.put(LanguageController());

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              CustomInput(
                controller: usernameController,
                labelText: "Username",
              ),
              CustomInput(
                controller: passwordController,
                labelText: "Password",
                // obscureText: true,
              ),
              const SizedBox(height: 20),
              Obx(() {
                return loginController.isLoading.value
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      loginController.login(
                        usernameController.text,
                        passwordController.text,
                      );
                    }
                  },
                  child: const Text("Login"),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
