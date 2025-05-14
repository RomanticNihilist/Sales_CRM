import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; // For date formatting

// --- Define or Import Data Models ---
// These classes are now part of the controller file as per user's code.
class User {
  final String id;
  final String shortName;
  final String fullName;
  final String imageUrl; // Use Network image or local asset path

  User({
    required this.id,
    required this.shortName,
    required this.fullName,
    required this.imageUrl,
  });
}

class UserMonthlyData {
  // Example: Map of Month Name -> Value
  final Map<String, double> values;
  // Example: A relevant date for the user details
  final DateTime relevantDate;

  UserMonthlyData({required this.values, required this.relevantDate});
}

class RoleCardData {
  final String roleTitle;
  final String fte;
  final String billingAmount;
  final String scrTarget;
  final String expenses;
  final String calculatedScr;
  final String otherCost;

  RoleCardData({
    required this.roleTitle,
    required this.fte,
    required this.billingAmount,
    required this.scrTarget,
    required this.expenses,
    required this.calculatedScr,
    required this.otherCost,
  });
}

// Controller provided by the user
class DealDetailsProfessionalController extends GetxController
    with GetSingleTickerProviderStateMixin {
  // --- Tab Controller Logic ---
  late TabController tabController;

  final List<Tab> tabs = const <Tab>[
    Tab(text: 'Schedule'),
    Tab(text: 'Resources'),
    Tab(text: 'Expenses'),
    Tab(text: 'Pricing'),
  ];

  // --- State for Schedule Tab ---
  final isProjectSetupExpanded = true.obs;
  final isUiDesignExpanded = true.obs;

  // --- State and Data for Resources Tab ---
  // Sample User Data (as provided by user)
  final List<User> resourceUsers = [
    User(
        id: '1',
        shortName: 'Emma',
        fullName: 'Emma Thompson',
        imageUrl:
            'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?q=80&w=2080&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
    User(
        id: '2',
        shortName: 'Mr. Smith',
        fullName: 'John Smith',
        imageUrl:
            'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?q=80&w=2080&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
    User(
        id: '3',
        shortName: 'Justin',
        fullName: 'Justin Lee',
        imageUrl:
            'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?q=80&w=2080&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
    User(
        id: '4',
        shortName: 'Justin',
        fullName: 'Justin Miller',
        imageUrl:
            'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?q=80&w=2080&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
    User(
        id: '5',
        shortName: 'Sarah',
        fullName: 'Sarah Jones',
        imageUrl:
            'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?q=80&w=2080&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
  ]; // This list is NOT reactive (.obs) as per user's code. UI relying on its changes needs careful handling.

  final List<String> resourceMonths = [
    // Also not reactive
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ];

  // Helper static list needed for direct initialization if using Map.fromIterable
  // This was part of the user's controller code.
  static const List<String> _resourceMonthsHelper = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  // Sample User Detail Data (as provided by user)
  final Map<String, UserMonthlyData> resourceUserDetails = {
    // Not reactive
    '1': UserMonthlyData(
        relevantDate: DateTime(2025, 7, 21),
        values: Map.fromIterable(_resourceMonthsHelper,
            key: (m) => m, value: (m) => 1.0)),
    '2': UserMonthlyData(relevantDate: DateTime(2025, 7, 21), values: {
      'January': 1.0,
      'February': 0.5,
      'March': 1.0,
      'April': 1.0,
      'May': 1.0,
      'June': 1.0,
      'July': 0.8,
      'August': 1.0,
      'September': 1.0,
      'October': 0.5,
      'November': 1.0,
      'December': 1.0,
    }),
    '3': UserMonthlyData(
        relevantDate: DateTime(2025, 7, 21),
        values: Map.fromIterable(_resourceMonthsHelper,
            key: (m) => m, value: (m) => 0.9)),
    '4': UserMonthlyData(
        relevantDate: DateTime(2025, 7, 21),
        values: Map.fromIterable(_resourceMonthsHelper,
            key: (m) => m, value: (m) => 0.7)),
    '5': UserMonthlyData(
        relevantDate: DateTime(2025, 7, 21),
        values: Map.fromIterable(_resourceMonthsHelper,
            key: (m) => m, value: (m) => 0.85)),
  };

  // Reactive state for the selected user
  final Rxn<User> selectedResourceUser = Rxn<User>();

  // Getter for selected user's details
  UserMonthlyData? get selectedResourceUserDetailsGetter {
    // Renamed to avoid conflict if a field had same name
    if (selectedResourceUser.value == null) return null;
    return resourceUserDetails[selectedResourceUser.value!.id] ??
        UserMonthlyData(
            relevantDate: DateTime.now(),
            values: Map.fromIterable(
                resourceMonths, // Uses non-reactive resourceMonths
                key: (m) => m,
                value: (m) => 0.0));
  }

  // --- State for Pricing Tab ---
  final RxList<RoleCardData> roleItems = <RoleCardData>[
    RoleCardData(
      roleTitle: 'Back Office',
      fte: '1.0',
      billingAmount: '33483.32',
      scrTarget: '25',
      expenses: '25',
      calculatedScr: '33450',
      otherCost: '33450',
    ),
    // Add other RoleCardData items as per user's controller
    RoleCardData(
      roleTitle: 'Back Office',
      fte: '1.0',
      billingAmount: '33483.32',
      scrTarget: '25',
      expenses: '25',
      calculatedScr: '33450',
      otherCost: '33450',
    ),
    RoleCardData(
      roleTitle: 'Back Office',
      fte: '1.0',
      billingAmount: '33483.32',
      scrTarget: '25',
      expenses: '25',
      calculatedScr: '33450',
      otherCost: '33450',
    ),
    RoleCardData(
      roleTitle: 'Back Office',
      fte: '1.0',
      billingAmount: '33483.32',
      scrTarget: '25',
      expenses: '25',
      calculatedScr: '33450',
      otherCost: '33450',
    ),
    RoleCardData(
      roleTitle: 'Back Office',
      fte: '1.0',
      billingAmount: '33483.32',
      scrTarget: '25',
      expenses: '25',
      calculatedScr: '33450',
      otherCost: '33450',
    ),
  ].obs;

  final RxInt selectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  // --- Actions for Schedule Tab ---
  void toggleProjectSetup() {
    isProjectSetupExpanded.value = !isProjectSetupExpanded.value;
  }

  void toggleUiDesign() {
    isUiDesignExpanded.value = !isUiDesignExpanded.value;
  }

  // --- Actions for Resources Tab ---
  void selectResourceUser(User user) {
    if (selectedResourceUser.value?.id == user.id) {
      selectedResourceUser.value =
          null; // Deselect if same user is tapped again
    } else {
      selectedResourceUser.value = user;
    }
  }

  // --- Helper Method for Date Formatting ---
  String formatResourceDate(DateTime date) {
    final DateFormat formatter =
        DateFormat('d MMMM yyyy'); // e.g., 21 July 2025
    return formatter.format(date);
  }

  // --- Action for Pricing Tab ---
  void selectCard(int index) {
    selectedIndex.value = index;
  }
}

class DealDetailsBinding extends Bindings {
  @override
  void dependencies() {
    // Use lazyPut for screen-specific controllers
    Get.lazyPut<DealDetailsProfessionalController>(
        () => DealDetailsProfessionalController());
  }
}
