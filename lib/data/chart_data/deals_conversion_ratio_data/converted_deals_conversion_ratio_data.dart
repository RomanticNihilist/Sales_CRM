import 'deals_conversion_ratio_data.dart';

class DealConversionRatioData {
  final List<String> xData;
  final List<int> yData;

  DealConversionRatioData({required this.xData, required this.yData});

  factory DealConversionRatioData.fromRawData(List<Map<String, dynamic>> rawData) {
    List<String> keys = rawDealConversionRateData.map((item) => item['key'] as String).toList();
    List<int> values = rawDealConversionRateData.map((item) => item['value'] as int).toList();

    return DealConversionRatioData(xData: keys, yData: values);
  }
}
