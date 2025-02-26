import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/auth_controller.dart';
import '../Controllers/language_controller.dart';
import '../components/custom_input.dart';
import 'auth_utils.dart';
import 'forgot_password.dart';


Widget buildBackgroundImage() {
  return SizedBox.expand(
    child: Image.asset(
      'assets/loginPageBackgroundImage.gif',
      fit: BoxFit.cover,
    ),
  );
}

Widget buildLogoSection() {
  return Column(
    children: [
      const SizedBox(height: 40),
      Image.asset('assets/keross-logo.png', height: 40),
      const SizedBox(height: 10),
    ],
  );
}

Widget buildLanguageDropdown(LanguageController languageController, Map<String, String> languageFlags) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Spacer(),
      Obx(() => buildDropdown(languageController, languageFlags)),
      const Spacer(),
    ],
  );
}

Widget buildDropdown(LanguageController languageController, Map<String, String> languageFlags) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12),
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Colors.white70),
    ),
    child: DropdownButton<String>(
      value: languageController.selectedLanguage.value,
      dropdownColor: Colors.black,
      icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white70),
      underline: const SizedBox(),
      style: const TextStyle(color: Colors.white70, fontSize: 14),
      items: languageController.languages.map((String language) {
        return DropdownMenuItem<String>(
          value: language,
          child: Text('${languageFlags[language] ?? '🏳️'} $language',
              style: const TextStyle(fontSize: 16, color: Colors.white70)),
        );
      }).toList(),
      onChanged: (String? newLanguage) {
        if (newLanguage != null) {
          languageController.updateLanguage(newLanguage);
        }
      },
    ),
  );
}

Widget buildTagline() {
  return const Padding(
    padding: EdgeInsets.symmetric(vertical: 20),
    child: Text(
      'Transforming complexity\ninto opportunity with AI',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.w800,
      ),
    ),
  );
}

Widget buildFooter() {
  return Column(
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
  );
}


// For Forgot Password Widget
Widget buildResetButton(TextEditingController usernameController) {
  return SizedBox(
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
      },
      child: const Text('Reset', style: TextStyle(color: Colors.white, fontSize: 16)),
    ),
  );
}

Widget buildGenerateNewPasswordButton(BuildContext context, AuthController authController, GlobalKey<FormState> formKey, TextEditingController usernameController) {
  return Obx(() {
    return authController.isLoading.value
        ? const CircularProgressIndicator()
        : SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF407BFF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () {
          handleResetPassword(formKey, usernameController, authController);
        },
        child: const Text('Generate New Password',
            style: TextStyle(color: Colors.white, fontSize: 16)),
      ),
    );
  });
}

Widget buildResetPasswordForm(BuildContext context, GlobalKey<FormState> formKey, TextEditingController usernameController, AuthController authController) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/ikon-logo.png', height: 40),
            const SizedBox(height: 10),
            const Text('Harness the Power of Data',
                style: TextStyle(color: Colors.black87, fontSize: 14)),
            const SizedBox(height: 20),
            CustomInput(
              controller: usernameController,
              labelText: 'Username',
              hintText: 'Enter your username',
              isMandatory: true,
              prefixIcon: const Icon(Icons.person_outline),
            ),
            const SizedBox(height: 20),
            buildGenerateNewPasswordButton(context, authController, formKey, usernameController),
            const SizedBox(height: 10),
            buildResetButton(usernameController),
          ],
        ),
      ),
    ),
  );
}






// For Login Widget
Widget buildLoginForm(BuildContext context, GlobalKey<FormState> formKey, TextEditingController usernameController, TextEditingController passwordController, AuthController authController) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/ikon-logo.png', height: 40),
            const SizedBox(height: 10),
            const Text('Harness the Power of Data',
                style: TextStyle(color: Colors.black87, fontSize: 14)),
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
            buildForgotPassword(),
            const SizedBox(height: 20),
            buildLoginButton(context, authController, formKey, usernameController, passwordController),
            const SizedBox(height: 10),
            buildResetButtonInLogin(usernameController, usernameController),
          ],
        ),
      ),
    ),
  );
}

Widget buildResetButtonInLogin(TextEditingController usernameController, TextEditingController passwordController) {
  return SizedBox(
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
      child: const Text('Reset', style: TextStyle(color: Colors.white, fontSize: 16)),
    ),
  );
}

Widget buildForgotPassword() {
  return Align(
    alignment: Alignment.centerRight,
    child: TextButton(
      onPressed: () {
        Get.to(ForgotPassword());
      },
      child: const Text('Forgot Password?',
          style: TextStyle(color: Colors.white)),
    ),
  );
}

Widget buildLoginButton(BuildContext context, AuthController authController, GlobalKey<FormState> formKey, TextEditingController usernameController, TextEditingController passwordController) {
  return Obx(() {
    return authController.isLoading.value
        ? const CircularProgressIndicator()
        : SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF407BFF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () {
          handleLogin(context, formKey, usernameController, passwordController, authController);
        },
        child: const Text('Login',
            style: TextStyle(color: Colors.white, fontSize: 16)),
      ),
    );
  });
}


