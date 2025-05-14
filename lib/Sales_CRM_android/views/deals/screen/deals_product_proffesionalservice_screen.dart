import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Make sure this import points to your actual controller file
import 'package:sale_crm/Sales_CRM_android/views/deals/controller/deals_details_professional_service_controller.dart';

class DealDetailsProfessionalScreen
    extends GetView<DealDetailsProfessionalController> {
  const DealDetailsProfessionalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Controller is accessed via 'controller' (this.controller) from GetView
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final appBarTheme = theme.appBarTheme;
    final tabBarTheme = theme.tabBarTheme;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new,
              size: 20.0, color: appBarTheme.foregroundColor),
          onPressed: () {
            Get.back();
            print("Back button pressed");
          },
        ),
        title: Text('Deal - Demo New Deal', style: appBarTheme.titleTextStyle),
        bottom: TabBar(
          controller: controller.tabController,
          tabs: controller.tabs,
          labelColor: tabBarTheme.labelColor,
          unselectedLabelColor: tabBarTheme.unselectedLabelColor,
          indicator: tabBarTheme.indicator,
          labelStyle: tabBarTheme.labelStyle,
          unselectedLabelStyle: tabBarTheme.unselectedLabelStyle,
        ),
      ),
      body: TabBarView(
        controller: controller.tabController,
        children: [
          _buildScheduleTab(context, controller),
          _buildResourcesTab(context), // Uses GetView's controller implicitly
          _buildExpensesTab(context, controller),
          _buildPricingTab(context, controller),
        ],
      ),
    );
  }

  // --- Schedule Tab ---
  Widget _buildScheduleTab(
      BuildContext context, DealDetailsProfessionalController controller) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        _buildExpandableSection(
          context: context,
          title: 'Project Setup',
          isExpanded: controller.isProjectSetupExpanded,
          onTap: controller.toggleProjectSetup,
          children: [
            _buildScheduleCard(
              context,
              title: 'Initialize repo',
              duration: '1 day',
              startDate: '2025-04-21',
              endDate: '2025-04-22',
              progress: 1.0,
              progressColor: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 12),
            _buildScheduleCard(
              context,
              title: 'Install dependencies',
              duration: '0.5 day',
              startDate: '2025-04-22',
              endDate: '2025-04-22',
              progress: 0.7,
              progressColor: Theme.of(context).colorScheme.primary,
            ),
          ],
        ),
        const SizedBox(height: 12),
        _buildExpandableSection(
          context: context,
          title: 'UI Design',
          isExpanded: controller.isUiDesignExpanded,
          onTap: controller.toggleUiDesign,
          children: [
            _buildScheduleCard(
              context,
              title: 'Wireframes',
              duration: '1 day',
              startDate: '2025-04-23',
              endDate: '2025-04-23',
              progress: 0.5,
              progressColor: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 12),
            _buildScheduleCard(
              context,
              title: 'Mobile Task List Page',
              duration: '2 days',
              startDate: '2025-04-24',
              endDate: '2025-04-25',
              progress: 0.3,
              progressColor: Theme.of(context).colorScheme.primary,
            ),
          ],
        ),
      ],
    );
  }

  // --- Expandable Section Helper ---
  Widget _buildExpandableSection({
    required BuildContext context,
    required String title,
    required RxBool isExpanded,
    required VoidCallback onTap,
    required List<Widget> children,
  }) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: textTheme.titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                Obx(() => Icon(
                      isExpanded.value ? Icons.expand_less : Icons.expand_more,
                      color: textTheme.bodySmall?.color,
                    )),
              ],
            ),
          ),
        ),
        Obx(() => Visibility(
              visible: isExpanded.value,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: children,
                ),
              ),
            )),
      ],
    );
  }

  // --- Schedule Card Widget ---
  Widget _buildScheduleCard(
    BuildContext context, {
    required String title,
    required String duration,
    required String startDate,
    required String endDate,
    required double progress,
    required Color progressColor,
  }) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final int progressPercent = (progress * 100).toInt();
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    title,
                    style: textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                Text(duration, style: textTheme.bodySmall),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Start: $startDate', style: textTheme.bodySmall),
                Text('End: $endDate', style: textTheme.bodySmall),
              ],
            ),
            const SizedBox(height: 10.0),
            Text(
              '$progressPercent% complete',
              style: textTheme.bodySmall?.copyWith(color: Colors.grey.shade700),
            ),
            const SizedBox(height: 6.0),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey.shade300,
              valueColor: AlwaysStoppedAnimation<Color>(progressColor),
              minHeight: 5.0,
            ),
          ],
        ),
      ),
    );
  }

  // --- Resources Tab ---
  Widget _buildResourcesTab(BuildContext context) {
    final DealDetailsProfessionalController ctrl =
        controller; // GetView's controller
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildResourceUserSelectionList(),
          const SizedBox(height: 20),
          Obx(() {
            final selectedUser = ctrl.selectedResourceUser.value;
            // Use the renamed getter from the controller
            final details = ctrl.selectedResourceUserDetailsGetter;
            if (selectedUser != null && details != null) {
              return Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16.0, bottom: 16.0),
                child: _buildResourceUserDetailsCard(selectedUser, details),
              );
            } else {
              return Container(
                padding: const EdgeInsets.all(32.0),
                alignment: Alignment.center,
                child: Text(
                  "Select a resource from the list above.",
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              );
            }
          }),
        ],
      ),
    );
  }

  // --- Helper: Horizontal User Selection List for Resources Tab ---
  Widget _buildResourceUserSelectionList() {
    final DealDetailsProfessionalController ctrl =
        controller; // GetView's controller
    return Container(
      height: 130,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        // Uses ctrl.resourceUsers (which is List<User>, not RxList, from user's controller)
        itemCount: ctrl.resourceUsers.length,
        itemBuilder: (context, index) {
          final user = ctrl.resourceUsers[index];
          return Obx(() {
            // This Obx depends on ctrl.selectedResourceUser
            final isSelected = ctrl.selectedResourceUser.value?.id == user.id;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GestureDetector(
                onTap: () => ctrl.selectResourceUser(user),
                child: Container(
                  width: 90,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xFF4A148C) : Colors.white,
                    borderRadius:
                        BorderRadius.circular(isSelected ? 15.0 : 10.0),
                    boxShadow: !isSelected
                        ? [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: const Offset(0, 2),
                            ),
                          ]
                        : [],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(user.imageUrl),
                        onBackgroundImageError: (_, __) {
                          print('Failed to load image: ${user.imageUrl}');
                        },
                        backgroundColor: Colors.grey[200],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        user.shortName,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: isSelected ? Colors.white : Colors.black87,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
        },
      ),
    );
  }

  // --- Helper: Details Card for Selected Resource User ---
  Widget _buildResourceUserDetailsCard(User user, UserMonthlyData details) {
    final BuildContext context = Get.context!;
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final DealDetailsProfessionalController ctrl =
        controller; // GetView's controller
    const Color cardBackgroundColor = Color(0xFF4A148C);
    final Color gridAreaBackgroundColor = Colors.grey.shade100;
    final Color monthTextColor = Colors.deepPurple.shade400;

    return Container(
      padding: const EdgeInsets.fromLTRB(2, 8, 2, 9),
      decoration: BoxDecoration(
        color: cardBackgroundColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.fullName,
                      style: textTheme.headlineSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      ctrl.formatResourceDate(details.relevantDate),
                      style: textTheme.bodyMedium
                          ?.copyWith(color: Colors.white.withOpacity(0.8)),
                    ),
                  ],
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(user.imageUrl),
                      onBackgroundImageError: (exception, stackTrace) {
                        print(
                            'Error loading avatar: ${user.imageUrl} $exception');
                      },
                      backgroundColor: Colors.white.withOpacity(0.3),
                    ),
                    Positioned(
                      top: -5,
                      right: -5,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: const Icon(
                          Icons.check_circle,
                          color: cardBackgroundColor,
                          size: 18,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: gridAreaBackgroundColor,
              borderRadius: BorderRadius.circular(15.0),
            ),
            // Uses ctrl.resourceMonths (List<String>) from user's controller
            child:
                _buildResourceMonthsGrid(ctrl, details.values, monthTextColor),
          ),
        ],
      ),
    );
  }

  // --- Helper: Months Grid for Selected Resource User ---
  Widget _buildResourceMonthsGrid(
      DealDetailsProfessionalController
          ctrl, // Pass controller for resourceMonths
      Map<String, double> monthlyValues,
      Color monthTextColor) {
    final BuildContext context = Get.context!;
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final Color lowValueBgColor = Colors.pink.shade100;
    final Color highValueBgColor = Colors.lightGreen.shade100;
    final Color valueTextColor = Colors.black87;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: ctrl.resourceMonths.length, // Uses controller's list
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 1.0,
      ),
      itemBuilder: (context, index) {
        final month = ctrl.resourceMonths[index];
        final value = monthlyValues[month] ?? 0.0;
        final bool isLowValue = value < 1.0;
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(color: const Color(0xFF4A148C), width: 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                month,
                style: textTheme.bodyMedium?.copyWith(
                  color: monthTextColor,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 6),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                decoration: BoxDecoration(
                  color: isLowValue ? lowValueBgColor : highValueBgColor,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Text(
                  value.toStringAsFixed(1),
                  style: textTheme.labelMedium?.copyWith(
                    color: valueTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // --- Expenses Tab ---
  Widget _buildExpensesTab(
      BuildContext context, DealDetailsProfessionalController controller) {
    const double listViewHorizontalPadding = 4.0;
    const double listViewVerticalPadding =
        8.0; // Reduced top/bottom padding for the list
    const double listItemVerticalPadding = 3.0;
    const double lineWidth = 3.5;
    final Color globalLineColor = Colors.grey.shade300;
    final theme = Theme.of(context); // Get theme for styling header

    // Use LayoutBuilder first to get constraints
    return Column(
      // Wrap everything in a Column
      children: [
        // Header Row
        Padding(
          padding: const EdgeInsets.only(
              left: listViewHorizontalPadding + 12, // Align with left content
              right: listViewHorizontalPadding + 12, // Align with right content
              top: 8.0, // Add padding above header
              bottom: 4.0 // Add padding below header
              ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Expense  Name',
                style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black // Style similar to item title
                    ),
              ),
              // Spacer(), // Use MainAxisAlignment.spaceBetween instead of Spacer
              IconButton(
                icon: Icon(Icons.sort, color: Colors.black), // Sorting icon
                onPressed: () {
                  // Call sorting function in controller
                  // controller.sortRoles();
                  print("Sort button pressed");
                },
                tooltip: 'Sort Roles',
                constraints: const BoxConstraints(), // Remove default padding
                padding: EdgeInsets.zero, // Remove default padding
              ),
            ],
          ),
        ),
        // List Section (takes remaining space)
        Expanded(
          // Make LayoutBuilder take remaining space
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              // Stack allows layering the line over the list
              return Stack(
                children: [
                  // Obx wraps the ListView builder and explicitly reads selectedIndex
                  Obx(() {
                    // Read selectedIndex here to ensure Obx tracks it as a dependency
                    // for rebuilding the list structure when selection changes.
                    final _selectedIndex = controller.selectedIndex.value;

                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: listViewHorizontalPadding,
                          // Removed vertical padding here, handled by Column's padding
                          vertical: 0),
                      itemCount:
                          controller.roleItems.length, // Depends on RxList
                      itemBuilder: (context, index) {
                        final itemData = controller.roleItems[index];
                        // isSelected is now correctly recalculated when ListView rebuilds
                        final bool isSelected = index == _selectedIndex;
                        // GestureDetector now handles selection AND navigation
                        return GestureDetector(
                          onTap: () {
                            // 1. Select the card in the controller
                            controller.selectCard(index);

                            // 2. Navigate (Optional - can be kept or removed based on desired flow)
                            // Get.to(
                            //   () => const DealDetailsProfessionalScreen(),
                            //   binding: DealDetailsBinding(),
                            //   arguments: {
                            //     'roleTitle': itemData.roleTitle,
                            //     'billingAmount': itemData.billingAmount,
                            //     'fte': itemData.fte,
                            //     'scrTarget': itemData.scrTarget,
                            //   },
                            // );
                          },
                          child: _ExpenseListItem(
                            data: itemData,
                            isSelected:
                                isSelected, // Pass the calculated selection state
                          ),
                        );
                      },
                    );
                  }),
                  // Positioned line - depends on roleItems being non-empty
                  Obx(() {
                    if (controller.roleItems.isEmpty) {
                      // If list is empty, don't draw the line
                      return const SizedBox.shrink(); // Return an empty widget
                    }
                    // Otherwise, draw the line
                    return Positioned(
                      left: listViewHorizontalPadding +
                          ((constraints.maxWidth -
                                  (2 * listViewHorizontalPadding)) /
                              3.2) - // Adjusted left position slightly
                          (lineWidth / 2.0),
                      // Adjust top/bottom based on the list's content area within the Stack
                      top: listItemVerticalPadding +
                          5, // Start slightly below list item padding
                      bottom: listItemVerticalPadding -
                          20, // End slightly above list item padding
                      child: Container(
                        width: lineWidth,
                        color: globalLineColor,
                      ),
                    );
                  }),
                  // Empty state message - depends on roleItems being empty
                  Obx(() {
                    if (controller.roleItems.isNotEmpty) {
                      return const SizedBox
                          .shrink(); // Don't show if list has items
                    }
                    // Show message if list is empty
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'No pricing items available.',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  // --- Expense Card ---
  // Widget _buildExpenseCard(BuildContext context) {
  //   final theme = Theme.of(context);
  //   final textTheme = theme.textTheme;
  //   return Card(
  //     child: Padding(
  //       padding: const EdgeInsets.all(16.0),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Text('Expense: New Expense', style: textTheme.titleMedium),
  //           const SizedBox(height: 8.0),
  //           const Divider(),
  //           _buildDetailItem(context, label: 'Location', value: 'Mexico'),
  //           _buildDetailItem(context, label: 'Currency', value: 'USD'),
  //           _buildDetailItem(context, label: 'Cost', value: '\$24.00'),
  //           _buildDetailItem(context, label: 'Quantity', value: '1'),
  //           _buildDetailItem(context, label: 'Total', value: '\$24.00'),
  //           _buildDetailItem(context, label: 'Status', value: 'Submitted'),
  //           _buildDetailItem(context, label: 'Manager', value: 'John Doe'),
  //           _buildDetailItem(context,
  //               label: 'Last Updated', value: '22-04-2025'),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // --- Pricing Tab ---
  Widget _buildPricingTab(
      BuildContext context, DealDetailsProfessionalController controller) {
    const double listViewHorizontalPadding = 4.0;
    const double listViewVerticalPadding =
        8.0; // Reduced top/bottom padding for the list
    const double listItemVerticalPadding = 3.0;
    const double lineWidth = 3.5;
    final Color globalLineColor = Colors.grey.shade300;
    final theme = Theme.of(context); // Get theme for styling header

    // Use LayoutBuilder first to get constraints
    return Column(
      // Wrap everything in a Column
      children: [
        // Header Row
        Padding(
          padding: const EdgeInsets.only(
              left: listViewHorizontalPadding + 12, // Align with left content
              right: listViewHorizontalPadding + 12, // Align with right content
              top: 8.0, // Add padding above header
              bottom: 4.0 // Add padding below header
              ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Role',
                style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black // Style similar to item title
                    ),
              ),
              // Spacer(), // Use MainAxisAlignment.spaceBetween instead of Spacer
              IconButton(
                icon: Icon(Icons.sort, color: Colors.black), // Sorting icon
                onPressed: () {
                  // Call sorting function in controller
                  // controller.sortRoles();
                  print("Sort button pressed");
                },
                tooltip: 'Sort Roles',
                constraints: const BoxConstraints(), // Remove default padding
                padding: EdgeInsets.zero, // Remove default padding
              ),
            ],
          ),
        ),
        // List Section (takes remaining space)
        Expanded(
          // Make LayoutBuilder take remaining space
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              // Stack allows layering the line over the list
              return Stack(
                children: [
                  // Obx wraps the ListView builder and explicitly reads selectedIndex
                  Obx(() {
                    // Read selectedIndex here to ensure Obx tracks it as a dependency
                    // for rebuilding the list structure when selection changes.
                    final _selectedIndex = controller.selectedIndex.value;

                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: listViewHorizontalPadding,
                          // Removed vertical padding here, handled by Column's padding
                          vertical: 0),
                      itemCount:
                          controller.roleItems.length, // Depends on RxList
                      itemBuilder: (context, index) {
                        final itemData = controller.roleItems[index];
                        // isSelected is now correctly recalculated when ListView rebuilds
                        final bool isSelected = index == _selectedIndex;
                        // GestureDetector now handles selection AND navigation
                        return GestureDetector(
                          onTap: () {
                            // 1. Select the card in the controller
                            controller.selectCard(index);

                            // 2. Navigate (Optional - can be kept or removed based on desired flow)
                            // Get.to(
                            //   () => const DealDetailsProfessionalScreen(),
                            //   binding: DealDetailsBinding(),
                            //   arguments: {
                            //     'roleTitle': itemData.roleTitle,
                            //     'billingAmount': itemData.billingAmount,
                            //     'fte': itemData.fte,
                            //     'scrTarget': itemData.scrTarget,
                            //   },
                            // );
                          },
                          child: _PricingListItem(
                            data: itemData,
                            isSelected:
                                isSelected, // Pass the calculated selection state
                          ),
                        );
                      },
                    );
                  }),
                  // Positioned line - depends on roleItems being non-empty
                  Obx(() {
                    if (controller.roleItems.isEmpty) {
                      // If list is empty, don't draw the line
                      return const SizedBox.shrink(); // Return an empty widget
                    }
                    // Otherwise, draw the line
                    return Positioned(
                      left: listViewHorizontalPadding +
                          ((constraints.maxWidth -
                                  (2 * listViewHorizontalPadding)) /
                              3.2) - // Adjusted left position slightly
                          (lineWidth / 2.0),
                      // Adjust top/bottom based on the list's content area within the Stack
                      top: listItemVerticalPadding +
                          5, // Start slightly below list item padding
                      bottom: listItemVerticalPadding -
                          20, // End slightly above list item padding
                      child: Container(
                        width: lineWidth,
                        color: globalLineColor,
                      ),
                    );
                  }),
                  // Empty state message - depends on roleItems being empty
                  Obx(() {
                    if (controller.roleItems.isNotEmpty) {
                      return const SizedBox
                          .shrink(); // Don't show if list has items
                    }
                    // Show message if list is empty
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'No pricing items available.',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  // --- Common Detail Item Helper ---
  Widget _buildDetailItem(BuildContext context,
      {required String label, required String value, Color? valueColor}) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: textTheme.labelMedium),
          const SizedBox(width: 16),
          Flexible(
            child: Text(
              value,
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: valueColor ?? textTheme.bodyMedium?.color,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}

class _PricingListItem extends StatelessWidget {
  final RoleCardData data;
  final bool isSelected; // Keep receiving isSelected as a parameter

  const _PricingListItem({
    required this.data,
    required this.isSelected, // Continue accepting isSelected
  });

  @override
  Widget build(BuildContext context) {
    // Determine colors based on the passed isSelected state
    final Color cardBackgroundColor =
        isSelected ? const Color(0xFF4A148C) : Colors.white;
    final Color textColor = isSelected ? Colors.white : Colors.black87;
    final Color lightTextColor = isSelected ? Colors.white70 : Colors.black54;

    // Removed IntrinsicHeight
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 5),
      child: Row(
        // Changed from stretch to start to let children determine height
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(top: 2.0, left: 8.0, right: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // Removed MainAxisAlignment.start as Column handles this
                children: [
                  Row(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align items nicely
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 0), // Align text better
                          child: Text(
                            data.roleTitle,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Colors.grey[700],
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ),
                      // Keep PopupMenuButton small and aligned
                      SizedBox(
                        // Constrain the button size if needed
                        height: 20, // Match approximate text line height
                        width: 20,
                        child: PopupMenuButton<String>(
                          icon: Icon(Icons.info_outline,
                              color: Colors.grey[500], size: 16),
                          tooltip: 'View full title',
                          padding: EdgeInsets.zero, // Remove default padding
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<String>>[
                            PopupMenuItem<String>(
                              value: 'title',
                              enabled: false,
                              child: Container(
                                constraints: BoxConstraints(
                                    maxWidth:
                                        MediaQuery.of(context).size.width *
                                            0.6),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 12.0),
                                child: Text(
                                  data.roleTitle,
                                  softWrap: true,
                                  style: const TextStyle(color: Colors.black87),
                                ),
                              ),
                            ),
                          ],
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Wrap Chip with Padding to add margin
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 4.0), // Add margin below the chip
                    child: Chip(
                      label: Text(
                        'FTE-${data.fte}',
                        style: TextStyle(
                          color: Colors.green[800],
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                      backgroundColor: Colors.green[100],
                      padding: const EdgeInsets.symmetric(
                          horizontal: 3.0, vertical: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      materialTapTargetSize:
                          MaterialTapTargetSize.shrinkWrap, // Make chip smaller
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Card(
                elevation: isSelected ? 4.0 : 1.0,
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                color: cardBackgroundColor, // Uses the isSelected state
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // Removed MainAxisAlignment.center as Column handles this
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Billing Amount',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: textColor, // Uses the isSelected state
                            ),
                          ),
                          Text(
                            'SCR - ${data.scrTarget}',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: textColor, // Uses the isSelected state
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'USD - ${data.billingAmount}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: textColor, // Uses the isSelected state
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Expenses - ${data.expenses}',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: textColor, // Uses the isSelected state
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildCostColumn(
                              'Calculated SCR',
                              data.calculatedScr,
                              lightTextColor,
                              textColor), // Uses the isSelected state
                          _buildCostColumn(
                              'Other Cost',
                              data.otherCost,
                              lightTextColor,
                              textColor), // Uses the isSelected state
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCostColumn(
      String title, String value, Color lightTextColor, Color valueColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 12, color: lightTextColor),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: valueColor),
        ),
      ],
    );
  }
}

class _ExpenseListItem extends StatelessWidget {
  final RoleCardData data;
  final bool isSelected; // Keep receiving isSelected as a parameter

  const _ExpenseListItem({
    required this.data,
    required this.isSelected, // Continue accepting isSelected
  });

  @override
  Widget build(BuildContext context) {
    // Determine colors based on the passed isSelected state
    final Color cardBackgroundColor =
        isSelected ? const Color(0xFF4A148C) : Colors.white;
    final Color textColor = isSelected ? Colors.white : Colors.black87;
    final Color lightTextColor = isSelected ? Colors.white70 : Colors.black54;

    // Removed IntrinsicHeight
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 5),
      child: Row(
        // Changed from stretch to start to let children determine height
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(top: 2.0, left: 8.0, right: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // Removed MainAxisAlignment.start as Column handles this
                children: [
                  Row(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align items nicely
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 0), // Align text better
                          child: Text(
                            data.roleTitle,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Colors.grey[700],
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ),
                      // Keep PopupMenuButton small and aligned
                      SizedBox(
                        // Constrain the button size if needed
                        height: 20, // Match approximate text line height
                        width: 20,
                        child: PopupMenuButton<String>(
                          icon: Icon(Icons.info_outline,
                              color: Colors.grey[500], size: 16),
                          tooltip: 'View full title',
                          padding: EdgeInsets.zero, // Remove default padding
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<String>>[
                            PopupMenuItem<String>(
                              value: 'title',
                              enabled: false,
                              child: Container(
                                constraints: BoxConstraints(
                                    maxWidth:
                                        MediaQuery.of(context).size.width *
                                            0.6),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 12.0),
                                child: Text(
                                  data.roleTitle,
                                  softWrap: true,
                                  style: const TextStyle(color: Colors.black87),
                                ),
                              ),
                            ),
                          ],
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Card(
                elevation: isSelected ? 4.0 : 1.0,
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                color: cardBackgroundColor, // Uses the isSelected state
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // Removed MainAxisAlignment.center as Column handles this
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Location',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: textColor, // Uses the isSelected state
                            ),
                          ),
                          Text(
                            'Cost - ${data.scrTarget} \$',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: textColor, // Uses the isSelected state
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        // 'USD - ${data.billingAmount}',
                        'Mexico',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: textColor, // Uses the isSelected state
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Quantity - ${data.expenses}',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: textColor, // Uses the isSelected state
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _expensebuildColumn(
                              'cost in loacal currency',
                              '22',
                              lightTextColor,
                              textColor), // Uses the isSelected state
                          _expensebuildColumn(
                              'Totat cost',
                              '24',
                              lightTextColor,
                              textColor), // Uses the isSelected state
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _expensebuildColumn(
      String title, String value, Color lightTextColor, Color valueColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 12, color: lightTextColor),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: valueColor),
        ),
      ],
    );
  }
}
