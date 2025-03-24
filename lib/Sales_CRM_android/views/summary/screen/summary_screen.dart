import 'package:flutter/material.dart';
import 'package:chart_package/chart_package.dart';
import 'package:get/get.dart';
import 'package:sale_crm/Sales_CRM_android/common_components/custom_card_view/screen/custom_card_view.dart';

import '../../../../data/chart_data/deals_conversion_ratio_data/converted_deals_conversion_ratio_data.dart';
import '../../../../data/chart_data/deals_conversion_ratio_data/deals_conversion_ratio_data.dart';
import '../../../../data/chart_data/products_by_product_name/converted_products_by_product_name_data.dart';
import '../../../../data/chart_data/products_by_product_name/products_by_product_name.dart';
import '../../../../data/chart_data/quater_wise_revenue_data/converted_quarter_wise_revenue_data.dart';
import '../../../../data/chart_data/quater_wise_revenue_data/quarter_wise_revenue_data.dart';
import '../../../../data/chart_data/sector_wise_deal_data/converted_sector_wise_deal_data.dart';
import '../../../../data/chart_data/sector_wise_deal_data/sector_wise_deal_data.dart';
import '../../../../data/chart_data/sector_wise_revenue_data/converted_sector_wise_revenue_data.dart';
import '../../../../data/chart_data/sector_wise_revenue_data/sector_wise_revenue_data.dart';
import '../controller/summary_screen_controller.dart';

class SummaryScreen extends StatelessWidget {
  SummaryScreen({super.key});

  final SummaryScreenController _summaryScreenController =
      Get.put(SummaryScreenController());

  @override
  Widget build(BuildContext context) {
    
    // final List<SectorWiseDealData> sectorData = SectorDataUtils.getSectorWiseData();
    final dealConversionRatioData =
        DealConversionRatioData.fromRawData(rawDealConversionRateData);
    final productsByProductName =
        ProductByProductNameData.fromRawData(rawProductsByProductData);
    final quarterWiseRevenueData =
        QuarterWiseRevenueData.fromRawData(rawQuarterWiseRevenueData);
    final sectorWiseRevenueData =
        SectorWiseRevenueData.fromRawData(sectorWiseRevenue);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sector-Wise Deals', // Title for the chart
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Obx(() {
                return CustomCardView(
                  widget: Stack(
                    children: [
                      Positioned(
                        // top: 6,
                        right: 8,
                        child: DropdownButton(
                          value: _summaryScreenController.selectedSector.value,
                          items: _summaryScreenController.sectorDropdownItem,
                          onChanged: (String? value) {
                            _summaryScreenController.selectedSector.value =
                                value!;
                            _summaryScreenController
                                .updateSelectedSectorData(value);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: ChartComponent(
                            // I have commented the previously written xData code
                            // sectorData.map((sector) {
                            //   return sector["sector"];
                            // }).toList(),
                            [
                              "won",
                              "open",
                              "lost",
                              "suspended"
                            ],
                            // I have commented the previously written yData code
                            // sectorData.map((sector) {
                            //   // Create the necessary structure for radial chart: [won, open, lost, suspended]
                            //   // return [
                            //   //   sector['won'],
                            //   //   sector['open'],
                            //   //   sector['lost'],
                            //   //   sector['suspended'],
                            //   // ];
                            //   return sector['won'] +
                            //       sector['open'] +
                            //       sector['lost'] +
                            //       sector['suspended'];
                            // }).toList(),
                            [
                              _summaryScreenController
                                      .selectedSectorData.value['won'] ??
                                  0,
                              _summaryScreenController
                                      .selectedSectorData.value['open'] ??
                                  0,
                              _summaryScreenController
                                      .selectedSectorData.value['lost'] ??
                                  0,
                              _summaryScreenController
                                      .selectedSectorData.value['suspended'] ??
                                  0,
                            ],
                            // Provide any other necessary data (like labels, titles, etc.)
                            true, // Assuming these are for customization like labels
                            true, // Maybe for interactivity
                            ChartType.radialChart),
                      ),
                    ],
                  ),
                );
              }),
              // CustomCardView(
              //   widget: ChartComponent(
              //     sectorData,
              //     [],
              //     true,
              //     true,
              //     ChartType.stackedColumnChart
              //   ),
              // ),
              // CustomCardView(sectorMapping: sectorMapping),
              const Text(
                'Deals Conversion Ratio', // Title for the chart
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              CustomCardView(
                widget: ChartComponent(dealConversionRatioData.xData,
                    dealConversionRatioData.yData, true, true, ChartType.pie),
              ),
              const Text(
                'Products By Product Name',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              CustomCardView(
                widget: ChartComponent(productsByProductName.xData,
                    productsByProductName.yData, true, true, ChartType.bar),
              ),
              const Text(
                'Quarter wise Revenue',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              CustomCardView(
                widget: ChartComponent(
                    quarterWiseRevenueData.xData,
                    quarterWiseRevenueData.yData,
                    true,
                    true,
                    ChartType.columnChart),
              ),
              const Text(
                'Sector wise Revenue',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              CustomCardView(
                widget: ChartComponent(
                    sectorWiseRevenueData.xData,
                    sectorWiseRevenueData.yData,
                    true,
                    true,
                    ChartType.columnChart),
              ),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
