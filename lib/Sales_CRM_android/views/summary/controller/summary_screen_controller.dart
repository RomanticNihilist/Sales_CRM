import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/chart_data/sector_wise_deal_data/sector_wise_deal_data.dart';

class SummaryScreenController extends GetxController {
  List<Map<String, dynamic>> sectorData = [];
  List<String> sectors = [];
  List<DropdownMenuItem<String>> sectorDropdownItem = [];
  RxString selectedSector = ''.obs;
  RxMap selectedSectorData = {}.obs;

  @override
  void onInit() {
    super.onInit();

    // Populate sector data and dropdown items
    final Set<String> uniqueSectors = {};
    sectorMapping.forEach((sector, data) {
      if (!uniqueSectors.contains(sector)) {
        uniqueSectors.add(sector);
        sectors.add(sector);
        sectorDropdownItem.add(DropdownMenuItem(value: sector, child: Text(sector)));

        List<int> values = [0, 0, 0, 0]; // won, open, lost, suspended
        for (var status in data) {
          if (status['key'] == 'won') {
            values[0] = status['value'];
          } else if (status['key'] == 'open') {
            values[1] = status['value'];
          } else if (status['key'] == 'lost') {
            values[2] = status['value'];
          } else if (status['key'] == 'suspended') {
            values[3] = status['value'];
          }
        }

        // Add sector data
        sectorData.add({
          'sector': sector,
          'won': values[0],
          'open': values[1],
          'lost': values[2],
          'suspended': values[3],
        });
      }
    });

    // Initialize selected sector and data
    if (sectors.isNotEmpty) {
      selectedSector.value = sectors[0]; // Ensure this matches a DropdownMenuItem value
      selectedSectorData.value = sectorData[0];
    }
  }

  void updateSelectedSectorData(String sector) {
    for (var data in sectorData) {
      if (data['sector'] == sector) {
        selectedSectorData.value = data;
        break;
      }
    }
  }
}