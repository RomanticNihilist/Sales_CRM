import 'package:flutter/material.dart';
import 'package:chart_package/chart_package.dart';
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

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> sectorData = [];
    sectorMapping.forEach((sector, data) {
      List<int> values = [0, 0, 0, 0];  // won, open, lost, suspended

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

      // Adding data for each sector
      sectorData.add({
        'sector': sector,
        'won': values[0],
        'open': values[1],
        'lost': values[2],
        'suspended': values[3],
      });
    });

    // final List<SectorWiseDealData> sectorData = SectorDataUtils.getSectorWiseData();
    final dealConversionRatioData = DealConversionRatioData.fromRawData(rawDealConversionRateData);
    final productsByProductName = ProductByProductNameData.fromRawData(rawProductsByProductData);
    final quarterWiseRevenueData = QuarterWiseRevenueData.fromRawData(rawQuarterWiseRevenueData);
    final sectorWiseRevenueData = SectorWiseRevenueData.fromRawData(sectorWiseRevenue);

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
              CustomCardView(
                widget: ChartComponent(
                    sectorData.map((sector){
                      return [
                        sector["sector"]
                      ];
                    }).toList(),
                    sectorData.map((sector) {
                      // Create the necessary structure for radial chart: [won, open, lost, suspended]
                      return [
                        sector['won'],
                        sector['open'],
                        sector['lost'],
                        sector['suspended'],
                      ];
                    }).toList(),
                     // Provide any other necessary data (like labels, titles, etc.)
                    true,  // Assuming these are for customization like labels
                    true,  // Maybe for interactivity
                    ChartType.radialChart
                ),
              ),
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
                widget: ChartComponent(
                    dealConversionRatioData.xData,
                    dealConversionRatioData.yData,
                    true,
                    true,
                    ChartType.pie
                ),
              ),
              const Text(
                'Products By Product Name',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              CustomCardView(
                  widget: ChartComponent(
                    productsByProductName.xData,
                    productsByProductName.yData,
                    true,
                    true,
                    ChartType.bar
                  ),
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
                    ChartType.columnChart
                ),
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
                  ChartType.columnChart
                ),
              ),
              const SizedBox(height: 100,)
            ],
          ),
        ),
      ),
    );
  }
}
