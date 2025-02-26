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
  final Map<String, String> languageFlags = {
    'EN': '🇺🇸', // English - USA flag
    'FR': '🇫🇷', // French - France flag
    'DE': '🇩🇪', // German - Germany flag
    'ES': '🇪🇸', // Spanish - Spain flag
  };

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            SizedBox.expand(
              child: Image.asset(
                'assets/loginPageBackgroundImage.gif',
                fit: BoxFit.cover,
              ),
            ),
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    Image.asset('assets/keross-logo.png', height: 40),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                        Obx(
                          () => Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.white70),
                            ),
                            child: DropdownButton<String>(
                              value: languageController.selectedLanguage.value,
                              dropdownColor: Colors.black,
                              icon: const Icon(Icons.keyboard_arrow_down,
                                  color: Colors.white70),
                              underline: const SizedBox(),
                              style: const TextStyle(
                                  color: Colors.white70, fontSize: 14),
                              items: languageController.languages
                                  .map((String language) {
                                return DropdownMenuItem<String>(
                                  value: language,
                                  child: Text(
                                    '${languageFlags[language] ?? '🏳️'} $language',
                                    style: const TextStyle(
                                        fontSize: 16, color: Colors.white70),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newLanguage) {
                                if (newLanguage != null) {
                                  languageController
                                      .updateLanguage(newLanguage);
                                }
                              },
                            ),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Transforming complexity\ninto opportunity with AI',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset('assets/ikon-logo.png', height: 40),
                              const SizedBox(height: 10),
                              const Text('Harness the Power of Data',
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 14)),
                              const SizedBox(height: 20),
                              CustomInput(
                                controller: usernameController,
                                labelText: 'Username',
                                hintText: 'Enter your username',
                                isMandatory: true,
                                prefixIcon: const Icon(Icons.person_outline),
                              ),
                              const SizedBox(height: 20),
                              CustomInput(
                                controller: passwordController,
                                labelText: 'Password',
                                hintText: 'Enter your password',
                                isMandatory: true,
                                prefixIcon: const Icon(Icons.lock_outline),
                                inputType: InputType.password,
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  child: const Text('Forgot Password?',
                                      style: TextStyle(color: Colors.white)),
                                  onPressed: () {
                                    // Navigate to ForgotPassword page if implemented
                                  },
                                ),
                              ),
                              const SizedBox(height: 20),
                              Obx(() {
                                return loginController.isLoading.value
                                    ? const CircularProgressIndicator()
                                    : SizedBox(
                                        width: double.infinity,
                                        height: 48,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color(0xFF407BFF),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                          onPressed: () {
                                            if (usernameController
                                                    .text.isEmpty ||
                                                passwordController
                                                    .text.isEmpty) {
                                              Get.snackbar(
                                                "Error",
                                                "Username and Password cannot be empty",
                                                snackPosition:
                                                    SnackPosition.TOP,
                                                colorText:
                                                    Colors.white, // White text
                                                duration: const Duration(
                                                    seconds:
                                                        3), // Duration to show
                                              );
                                            } else if (_formKey.currentState!
                                                .validate()) {
                                              loginController.isLoading.value =
                                                  true;

                                              
                                              loginController
                                                  .login(
                                                usernameController.text,
                                                passwordController.text,
                                              )
                                                  .then((_) {
                                                loginController
                                                    .isLoading.value = false;

                                              }).catchError((error) {
                                                loginController
                                                    .isLoading.value = false;
                                                Get.snackbar(
                                                  "Error",
                                                  "Login failed. Please check your credentials.",
                                                  snackPosition:
                                                      SnackPosition.TOP,
                                                  colorText: Colors
                                                      .white, // White text
                                                  duration: const Duration(
                                                      seconds:
                                                          3), // Duration to show
                                                );
                                              });
                                            }
                                          },
                                          child: const Text(
                                            'Login',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      );
                              }),
                              const SizedBox(height: 10),
                              SizedBox(
                                width: double.infinity,
                                height: 48,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  onPressed: () {
                                    usernameController.clear();
                                    passwordController.clear();
                                  },
                                  child: const Text(
                                    'Reset',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account?",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 60),
                        const Text(
                          'Looking for Support?',
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Version 6.5.2',
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Powered By ',
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 16,
                              ),
                            ),
                            Image.asset(
                              'assets/keross-footer.png',
                              height: 16,
                            ),
                            const Text(
                              ' | © 2025',
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Icon(
                              Icons.menu,
                              color: Colors.white54,
                              size: 30,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
