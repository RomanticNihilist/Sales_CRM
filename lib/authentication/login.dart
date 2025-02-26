import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/auth_controller.dart';
import '../Controllers/language_controller.dart';
import 'UI_utils.dart';

class LoginPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthController authController = Get.put(AuthController());
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
            buildBackgroundImage(),
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    buildLogoSection(),
                    buildLanguageDropdown(languageController, languageFlags),
                    buildTagline(),
                    buildLoginForm(context, _formKey, usernameController, passwordController, authController),
                    buildFooter(),
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
