// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sale_crm/Sales_CRM_android/sales_crm_entry_point_android/screen/sales_crm_entry_point_android.dart';
// import 'package:sale_crm/services/api_service.dart';
// import 'package:sale_crm/splash_screen.dart';
// import 'authentication/login_ios.dart';
// import 'splash_screen_ios.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   Get.put(ApiService());
//   runApp(SalesCRM());
// }

// class SalesCRM extends StatelessWidget {
//   const SalesCRM({super.key});

//   @override
//   Widget build(BuildContext context) {
//     if (Platform.isAndroid) {
//       return GetMaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Sales CRM App',
//         // home: SplashScreen(), // commment for developing purpose need to comment out  later
//         home: SalesCrmEntryPointAndroid(),
//       );
//       // return GetCupertinoApp(
//       //   debugShowCheckedModeBanner: false,
//       //   title: "Sales CRM IOS",
//       //   home: SplashScreenIos(),
//       // );
//     } else {
//       return GetCupertinoApp(
//         debugShowCheckedModeBanner: false,
//         title: "Sales CRM IOS",
//         home: LoginPageIos(),
//       );
//     }
//     //
//     // return GetCupertinoApp(
//     //   debugShowCheckedModeBanner: false,
//     //   title: "Sales CRM IOS",
//     //   home: LoginPageIos(),
//     // );
//   }
// }

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sale_crm/Sales_CRM_android/sales_crm_entry_point_android/screen/sales_crm_entry_point_android.dart'; // Your import
import 'package:sale_crm/services/api_service.dart'; // Your import
// Assuming these are your iOS related imports
import 'authentication/login_ios.dart';
// import 'splash_screen_ios.dart'; // Uncomment if needed

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ApiService()); // Initialize your service
  runApp(const SalesCRM()); // Run the main app widget
}

// Define the theme data separately for clarity
// This is the theme defined in the previous 'flutter_deals_ui' artifact
// final ThemeData materialAppTheme = ThemeData(
//   primarySwatch: Colors.blue,
//   fontFamily:
//       'Inter', // Ensure Inter font is added to your project pubspec.yaml
//   scaffoldBackgroundColor: const Color(0xFFF0F2F5), // Light gray background
//   appBarTheme: const AppBarTheme(
//     backgroundColor: Colors.white, // White AppBar background
//     foregroundColor:
//         Colors.black87, // Color for title and icons if not overridden
//     elevation: 1.0, // Subtle shadow/border
//     iconTheme: IconThemeData(
//         color: Colors.black54), // Default icon color (like back arrow)
//     titleTextStyle: TextStyle(
//       color: Colors.black87,
//       fontSize: 18.0,
//       fontWeight: FontWeight.w600, // Semibold
//       fontFamily: 'Inter',
//     ),
//   ),
//   // Define default TextTheme
//   textTheme: const TextTheme(
//     titleLarge: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
//     bodyMedium: TextStyle(fontSize: 14.0),
//     labelLarge: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
//     // Updated titleSmall for Section Header style
//     titleSmall: TextStyle(
//       fontSize: 12.0,
//       fontWeight: FontWeight.w600,
//       color: Colors.blue, // Target blue color
//       letterSpacing: 0.5, // Slight spacing
//     ),
//   ),
//   // Basic input decoration theme (Your CustomInput/other inputs might override this)
//   inputDecorationTheme: InputDecorationTheme(
//     contentPadding:
//         const EdgeInsets.symmetric(vertical: 14.0, horizontal: 10.0),
//     border: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(8.0),
//       borderSide: const BorderSide(color: Colors.grey),
//     ),
//     enabledBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(8.0),
//       borderSide: BorderSide(color: Colors.grey.shade400),
//     ),
//     focusedBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(8.0),
//       borderSide:
//           const BorderSide(color: Colors.blue, width: 1.5), // Adjusted width
//     ),
//     hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14.0),
//     prefixIconColor: Colors.grey.shade500,
//   ),
//   // Add other theme properties if needed (button themes, card themes, etc.)
// );

class SalesCRM extends StatelessWidget {
  const SalesCRM({super.key});

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      // Apply the defined theme to GetMaterialApp
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sales CRM App',
        theme: ThemeData(
          // Keep the existing theme configuration
          primarySwatch: Colors.blue,
          textTheme: const TextTheme(
            bodyMedium: TextStyle(fontFamily: 'Inter', fontSize: 14.0),
            titleMedium: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16.0,
                fontWeight: FontWeight.w500),
            titleLarge: TextStyle(
                fontFamily: 'Inter',
                fontSize: 18.0,
                fontWeight: FontWeight.w600),
            labelMedium: TextStyle(
                fontFamily: 'Inter', fontSize: 12.0, color: Colors.grey),
            // Added bodySmall for schedule dates, ensure it's defined
            bodySmall: TextStyle(fontFamily: 'Inter', fontSize: 12.0),
          ),
          cardTheme: CardTheme(
            elevation: 2.0,
            margin: const EdgeInsets.only(bottom: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: BorderSide(color: Colors.grey.shade200, width: 1.0),
            ),
            color: Colors.white,
          ),
          dividerTheme: DividerThemeData(
            color: Colors.grey.shade100,
            thickness: 1.0,
          ),
          tabBarTheme: TabBarTheme(
            labelColor: Colors.blue.shade600,
            unselectedLabelColor: Colors.grey.shade600,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(color: Colors.blue.shade600, width: 2.0),
            ),
            labelStyle: const TextStyle(
                fontFamily: 'Inter', fontWeight: FontWeight.w500),
            unselectedLabelStyle: const TextStyle(fontFamily: 'Inter'),
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black87,
            elevation: 1.0,
            titleTextStyle: TextStyle(
              fontFamily: 'Inter',
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          scaffoldBackgroundColor: Colors.grey.shade100,
        ), // <-- Apply the theme here
        // home: SplashScreen(), // Your original comment
        home: SalesCrmEntryPointAndroid(), // Your Android entry point
      );
    } else {
      // iOS part remains the same, using GetCupertinoApp
      // You might want to define a CupertinoThemeData for consistency on iOS
      return GetCupertinoApp(
        debugShowCheckedModeBanner: false,
        title: "Sales CRM IOS",
        home: LoginPageIos(), // Your iOS entry point
        // theme: CupertinoThemeData(...) // Optional: Add Cupertino theme
      );
    }
  }
}
