import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DealsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var isSearchVisible = false.obs;
  late AnimationController _animationController;
  late Animation<double> animation;

  @override
  void onInit() {
    super.onInit();
    // Initialize the animation controller with vsync
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300), // Duration for animation
    );

    // Initialize the animation with a Tween
    animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
  }

  @override
  void onClose() {
    // Dispose the animation controller when the controller is closed
    _animationController.dispose();
    super.onClose();
  }

  // Method to toggle the visibility of the search bar
  void toggleSearchVisibility() {
    isSearchVisible.value = !isSearchVisible.value;

    // Start or reverse the animation based on the visibility state
    if (isSearchVisible.value) {
      _animationController.forward(); // Show search bar
    } else {
      _animationController.reverse(); // Hide search bar
    }
  }
}
