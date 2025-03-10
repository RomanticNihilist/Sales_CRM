import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:sale_crm/Sales_CRM_iOS/common_components_ios/bottom_modal_ios/widget/bottom_modal_ios.dart';
import 'package:sale_crm/Sales_CRM_iOS/common_components_ios/generic_dropdown/widget/generic_dropdown_ios.dart';
import 'package:sale_crm/components/custom_input_IOS.dart';

import '../../../../../services/api_service.dart';

class EventFormIos extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _eventTitleController = TextEditingController();
  final TextEditingController _meetingLinkController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final GenericDropdownControllerIos<String> repeatMeetingController =
      GenericDropdownControllerIos<String>(displayValue: (item) => item);
  final GenericDropdownControllerIos<String> remindBeforeController =
      GenericDropdownControllerIos<String>(displayValue: (item) => item);

  final GenericDropdownControllerIos<Map<String, dynamic>> userController =
      GenericDropdownControllerIos<Map<String, dynamic>>(
    displayValue: (user) => user['USER_NAME'],
  );

  final List<String> repeatMeetingDropDownValue = [
    "None",
    "Daily",
    "Weekly",
    "Monthly",
    "Yearly"
  ];
  final List<String> remindBeforeDropDownValue = [
    "1 hour",
    "2 hours",
    "12 hours",
    "24 hours"
  ];

  final ApiService _apiService = Get.find<ApiService>();

  // Store Future to prevent multiple API calls
  final Future<List<Map<String, dynamic>>> _futureActiveUsers;

  EventFormIos({Key? key})
      : _futureActiveUsers = getActiveUsersMap(),
        super(key: key);

  static Future<List<Map<String, dynamic>>> getActiveUsersMap() async {
    try {
      List<dynamic>? users = await Get.find<ApiService>().getAllUsers();

      if (users == null || users.isEmpty) {
        print("No users found");
        return [];
      }

      print("API Response: $users");

      List<Map<String, dynamic>> activeUsersList = users
          .whereType<Map<String, dynamic>>() // Ensure each item is a Map
          .where((user) =>
              user['ACTIVE'] == true) // FIXED: Corrected boolean check
          .map((user) => {
                'USER_ID': user['USER_ID']?.toString() ?? '',
                'USER_NAME': user['USER_NAME']?.toString() ?? 'Unknown',
              })
          .where((user) => user['USER_ID']!.isNotEmpty) // Ensure valid ID
          .toList();

      print("Final Active Users List: $activeUsersList");

      return activeUsersList;
    } catch (error, stackTrace) {
      print("Error while processing active users: $error");
      print(stackTrace);
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = CupertinoTheme.of(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: BottomModalIos(
        // containerHeight: 800.0,
        child: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            leading: CupertinoButton(
              padding: EdgeInsets.zero,
              child: Text("Close"),
              onPressed: () {
                Get.back();
              },
            ),
            middle: Text("Add Event"),
            trailing: CupertinoButton(
              padding: EdgeInsets.zero,
              child: Text("Save"),
              onPressed: () {
                Get.back();
              },
            ),
          ),
          // title: Text("Add Event"),
          child: Container(
            height: double.infinity,
            padding: EdgeInsets.only(top: 70.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomInputIOS(
                      labelText: "Event Title",
                      hintText: 'Enter event title',
                      prefixIcon: Icon(CupertinoIcons.calendar),
                      isMandatory: true,
                    ),
                    SizedBox(height: 16.0),
                    // FutureBuilder for Active Users Dropdown
                    FutureBuilder<List<Map<String, dynamic>>>(
                      future: _futureActiveUsers,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CupertinoActivityIndicator());
                        }

                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }

                        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                          return GenericDropdownIos<Map<String, dynamic>>(
                            labelText: "Please Assign Member(s)",
                            isMultiSelect: true,
                            items: snapshot.data!,
                            hintText: 'Username',
                            displayValue: (user) => user['USER_NAME'],
                            controller: userController,
                            isMandatory: true,
                            prefixIcon: Icon(IconlyLight.user),
                            suffixIcon: Icon(CupertinoIcons.arrow_down),  
                          );
                        } else {
                          return Text('No active users found');
                        }
                      },
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
