import 'package:flutter/material.dart';

class CustomCardView extends StatelessWidget{
  final Widget widget;
  const CustomCardView({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        width: double.infinity,
        height: 300, // Adjust the height as needed
        padding: const EdgeInsets.all(16.0),
        child: widget
      ),
    );
  }
}






// import 'package:flutter/material.dart';
//
// class CustomCardView extends StatelessWidget {
//   final Widget widget;
//   final Widget? dropdown;
//
//   const CustomCardView({
//     Key? key,
//     required this.widget,
//     this.dropdown,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4.0,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Container(
//         width: double.infinity,
//         height: 300, // Adjust the height as needed
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Only show the dropdown if it's provided
//             if (dropdown != null) ...[
//               dropdown!,
//               const SizedBox(height: 16),
//             ],
//             // Expanded widget to let the main content fill the remaining space
//             Expanded(child: widget),
//           ],
//         ),
//       ),
//     );
//   }
// }








//
// class CustomCardView extends StatefulWidget {
//   final Widget? widget;
//   final Map<String, List<Map<String, dynamic>>>? sectorMapping;
//
//   const CustomCardView({super.key, this.sectorMapping, this.widget});
//
//   @override
//   _CustomCardViewState createState() => _CustomCardViewState();
// }
//
// class _CustomCardViewState extends State<CustomCardView> {
//   String? selectedSector;
//   SectorChartData? chartData;
//
//   @override
//   void initState() {
//     super.initState();
//     selectedSector = widget.sectorMapping?.keys.first; // Default to first sector
//     chartData = SectorChartData.fromRawData(widget.sectorMapping![selectedSector]!);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4.0,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Container(
//         width: double.infinity,
//         height: 300, // Adjust the height as needed
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             DropdownButton<String>(
//               value: selectedSector,
//               onChanged: (String? newSector) {
//                 setState(() {
//                   selectedSector = newSector;
//                   chartData = SectorChartData.fromRawData(
//                       widget.sectorMapping![selectedSector]!);
//                 });
//               },
//               items: widget.sectorMapping?.keys
//                   .map((sector) => DropdownMenuItem<String>(
//                 value: sector,
//                 child: Text(sector),
//               ))
//                   .toList(),
//             ),
//             const SizedBox(height: 16),
//             // You can now show the chart data as needed.
//             if (chartData != null)
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text('Sector: $selectedSector'),
//                   Text('Keys: ${chartData?.xData.join(', ')}'),
//                   Text('Values: ${chartData?.yData.join(', ')}'),
//                 ],
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }