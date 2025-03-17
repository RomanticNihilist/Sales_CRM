import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sale_crm/Controllers/auth_controller.dart';
import '../Controllers/language_controller.dart';
import '../components/custom_input.dart';
import 'UI_utils_ios.dart';

class ForgotPasswordIos extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final AuthController authController = Get.put(AuthController());
  final LanguageController languageController = Get.put(LanguageController());
  final Map<String, String> languageFlags = {
    'EN': '🇺🇸',
    'FR': '🇫🇷',
    'DE': '🇩🇪',
    'ES': '🇪🇸',
  };

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: true,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            buildBackgroundImageIos(),
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    buildLogoSectionIos(),
                    buildLanguageDropdownIos(languageController, languageFlags),
                    buildTaglineIos(),
                    SizedBox(height: 20),
                    buildResetPasswordFormIos(context, _formKey, usernameController, authController),
                    buildFooterIos(),
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
