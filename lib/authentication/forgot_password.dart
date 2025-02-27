import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sale_crm/Controllers/auth_controller.dart';

import '../Controllers/language_controller.dart';
import '../components/custom_input.dart';
import 'UI_utils.dart';

class ForgotPassword extends StatelessWidget{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final AuthController authController = Get.put(AuthController());
  final LanguageController languageController = Get.put(LanguageController());
  final Map<String, String> languageFlags = {
    'EN': '🇺🇸', // English - USA flag
    'FR': '🇫🇷', // French - France flag
    'DE': '🇩🇪', // German - Germany flag
    'ES': '🇪🇸', // Spanish - Spain flag
  };

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
                    buildResetPasswordForm(context, _formKey, usernameController, authController),
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