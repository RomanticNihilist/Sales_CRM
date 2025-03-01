import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter/material.dart';

class CalendarControllerX extends GetxController {
  var selectedView = "Month".obs;
  var selectedDate = DateTime.now().obs;
  var appointments = <Appointment>[].obs;

  late CalendarController calendarController;

  @override
  void onInit() {
    super.onInit();
    calendarController = CalendarController();
    calendarController.view = _getCalendarView(selectedView.value);
    calendarController.displayDate = selectedDate.value;
  }

  void changeView(String view) {
    selectedView.value = view;
    calendarController.view = _getCalendarView(view);
    update();
  }

  void changeDate(DateTime date) {
    selectedDate.value = date;
    calendarController.displayDate = date;
    update();
  }

  /// ✅ Fix: Trigger calendar refresh correctly
  void addEvent(Appointment event) {
    appointments.add(event);
    update();
  }

  CalendarView _getCalendarView(String view) {
    switch (view) {
      case "Week":
        return CalendarView.week;
      case "Day":
        return CalendarView.day;
      case "Month":
      default:
        return CalendarView.month;
    }
  }

  void onFloatingActionButtonPressed() {
    final event = Appointment(
      startTime: DateTime.now(),
      endTime: DateTime.now().add(Duration(hours: 1)),
      subject: 'New Event',
      color: Colors.blue,
      isAllDay: false,
    );
    addEvent(event);
  }
}
