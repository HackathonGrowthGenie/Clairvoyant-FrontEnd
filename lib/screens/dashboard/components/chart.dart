import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class Chart extends StatelessWidget {
  const Chart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          PieChart(
            PieChartData(
              sectionsSpace: 0,
              centerSpaceRadius: 70,
              startDegreeOffset: -90,
              sections: paiChartSelectionData,
            ),
            swapAnimationDuration: Duration(seconds: 5), // Optional
            swapAnimationCurve: Curves.linear,
          ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: defaultPadding),
                Text(
                  "80%",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        height: 0.5,
                      ),
                ),
                Text("ROI")
              ],
            ),
          ),
        ],
      ),
    );
  }
}

List<PieChartSectionData> paiChartSelectionData = [
  PieChartSectionData(
    color: primaryColor,
    value: 25,
    showTitle: false,
    radius: 25,
  ),
  PieChartSectionData(
    color: Color(0xFF26E5FF),
    value: 20,
    showTitle: false,
    radius: 22,
  ),
  PieChartSectionData(
    color: Color(0xFFFFCF26),
    value: 10,
    showTitle: false,
    radius: 19,
  ),
  PieChartSectionData(
    color: Color(0xFFEE2727),
    value: 15,
    showTitle: false,
    radius: 16,
  ),
  PieChartSectionData(
    color: primaryColor.withOpacity(0.1),
    value: 25,
    showTitle: false,
    radius: 13,
  ),
];


// import 'package:charts_flutter/flutter.dart' as charts;
// import 'package:flutter/material.dart';
//
// import '../../../constants.dart';
//
// class Chart extends StatefulWidget {
//   const Chart({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<Chart> createState() => _ChartState();
// }
//
// class _ChartState extends State<Chart> {
//   List<charts.Series<Task, String>>? _seriesPieData;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _seriesPieData = <charts.Series<Task, String>>[];
//     _generateData();
//   }
//   _generateData() {
//     var piedata = [
//       new Task('Work', 35.8, Color(0xff3366cc)),
//       new Task('Eat', 8.3, Color(0xff990099)),
//       new Task('Commute', 10.8, Color(0xff109618)),
//       new Task('TV', 15.6, Color(0xfffdbe19)),
//       new Task('Sleep', 19.2, Color(0xffff9900)),
//       new Task('Other', 10.3, Color(0xffdc3912)),
//     ];
//     _seriesPieData?.add(
//       charts.Series(
//         domainFn: (Task task, _) => task.task,
//         measureFn: (Task task, _) => task.taskvalue,
//         colorFn: (Task task, _) =>
//             charts.ColorUtil.fromDartColor(task.colorval),
//         id: 'abc',
//         data: piedata,
//         labelAccessorFn: (Task row, _) => '${row.taskvalue}',
//       ),
//     );
//   }
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 200,
//       child: Stack(
//         children: [
//           charts.PieChart(
//               _seriesPieData!,
//               animate: true,
//               animationDuration: Duration(seconds: 5),
//               defaultRenderer: new charts.ArcRendererConfig(
//                   arcWidth: 100,
//                   arcRendererDecorators: [
//                     new charts.ArcLabelDecorator(
//                         labelPosition: charts.ArcLabelPosition.inside)
//                   ])
//           ),
//           // PieChart(
//           //   PieChartData(
//           //     sectionsSpace: 0,
//           //     centerSpaceRadius: 70,
//           //     startDegreeOffset: -90,
//           //     sections: paiChartSelectionData,
//           //   ),
//           // ),
//           Positioned.fill(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SizedBox(height: defaultPadding),
//                 Text(
//                   "80%",
//                   style: Theme.of(context).textTheme.headlineMedium!.copyWith(
//                     color: Colors.white,
//                     fontWeight: FontWeight.w600,
//                     height: 0.5,
//                   ),
//                 ),
//                 Text("ROI")
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// // List<PieChartSectionData> paiChartSelectionData = [
// //   PieChartSectionData(
// //     color: primaryColor,
// //     value: 25,
// //     showTitle: false,
// //     radius: 25,
// //   ),
// //   PieChartSectionData(
// //     color: Color(0xFF26E5FF),
// //     value: 20,
// //     showTitle: false,
// //     radius: 22,
// //   ),
// //   PieChartSectionData(
// //     color: Color(0xFFFFCF26),
// //     value: 10,
// //     showTitle: false,
// //     radius: 19,
// //   ),
// //   PieChartSectionData(
// //     color: Color(0xFFEE2727),
// //     value: 15,
// //     showTitle: false,
// //     radius: 16,
// //   ),
// //   PieChartSectionData(
// //     color: primaryColor.withOpacity(0.1),
// //     value: 25,
// //     showTitle: false,
// //     radius: 13,
// //   ),
// // ];
// class Task {
//   String task;
//   double taskvalue;
//   Color colorval;
//
//   Task(this.task, this.taskvalue, this.colorval);
// }