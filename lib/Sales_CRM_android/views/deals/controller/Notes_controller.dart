import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotesController extends GetxController {
  var noteText = ''.obs; // Observable variable for note text

  TextEditingController notesTakingcontroler = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    // Sync TextEditingController with noteText
    notesTakingcontroler.addListener(() {
      noteText.value = notesTakingcontroler.text;
    });
  }

  void saveNote() {
    if (noteText.isNotEmpty) {
      // Handle saving the note (e.g., adding it to a list)
      print('Saved Note: ${noteText.value}');
    }
  }

  void clearNote() {
    noteText.value = ''; // Clear the note text
  }

  @override
  void onClose() {
    notesTakingcontroler
        .dispose(); // Dispose of the controller when it's no longer needed
    super.onClose();
  }
}
