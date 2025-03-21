// import 'package:chart_package/chart_package.dart';
// import 'sector_wise_deal_data.dart';
//
// class SectorDataUtils {
//   static List<SectorWiseDealData> getSectorWiseData() {
//     return rawSectorData.map((e) => SectorWiseDealData.fromMap(e)).toList();
//   }
//   // static Map<String, List<int>> getSectorWiseData() {
//   //   return {
//   //     for (var sector in rawSectorData)
//   //       sector["sector"]: [
//   //         sector["wonCount"],
//   //         sector["lostCount"],
//   //         sector["openCount"],
//   //         sector["suspendedCount"]
//   //       ],
//   //   };
//   // }
// }


// class SectorChartData {
//   final List<String> xData;
//   final List<int> yData;
//
//   SectorChartData({required this.xData, required this.yData});
//
//   factory SectorChartData.fromRawData(List<Map<String, dynamic>> rawData) {
//     List<String> keys = rawData.map((item) => item['key'] as String).toList();
//     List<int> values = rawData.map((item) => item['value'] as int).toList();
//
//     return SectorChartData(xData: keys, yData: values);
//   }
// }
