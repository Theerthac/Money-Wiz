// import 'package:flutter/material.dart';
// import 'package:project/model/add_data.dart';
// import 'package:project/utility/utility.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

// class Chart extends StatefulWidget {
//   int indexx;
//   Chart({Key? key, required this.indexx}) : super(key: key);

//   @override
//   State<Chart> createState() => _ChartState();
// }

// class _ChartState extends State<Chart> {
//   List<add_data>? a;
//   bool b = true;
//   bool j = true;
//   late List<Datas> _chartdata;
//   late TooltipBehavior _tooltipBehavior;

//   @override
//   void initState() {
//     _chartdata = getchartDatas();
//     _tooltipBehavior = TooltipBehavior(enable: true);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     switch (widget.indexx) {
//       case 0:
//         a = today();
//         b = true;
//         j = true;
//         break;
//       case 1:
//         a = week();
//         b = false;
//         j = true;
//         break;
//       case 2:
//         a = month();
//         b = false;
//         j = true;
//         break;
//       case 3:
//         a = year();

//         j = false;
//         break;
//       default:
//     }
//     return Scaffold(
//       body: Container(
//         child: SfCircularChart(
//           legend: Legend(
//               isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
//           tooltipBehavior: _tooltipBehavior,
//           series: <CircularSeries>[
//             DoughnutSeries<Datas, String>(
//                 dataSource: _chartdata,
//                 xValueMapper: (Datas data, _) => data.expandincome,
//                 yValueMapper: (Datas data, _) => data.year,
//                 dataLabelSettings: const DataLabelSettings(
//                   isVisible: true,
//                 ),
//                 enableTooltip: true)
//           ],
//         ),
//       ),
//     );
//   }

//   List<Datas> getchartDatas() {
//     final List<Datas> chartdata = [
//       ...List.generate(time(a! , b ?true : false).length, (index) {
//         return Datas(
//           j
//             ? b
//               ? a![index].dateTime.hour.toString()
//               :a![index].dateTime.day.toString()
//               :a![index].dateTime.month.toString(),
//           b
//           ? index > 0
//           ? time(a!, true)[index] +
//            time(a!, true)[index - 1]
//            :time(a!, true)[index]
//           : index > 0
//          ? time(a!, false)[index] +
//          time(a!, false)[index - 1]
//          :time(a!, false)[index]
//          );
//       })
//     ];
//     return chartdata;
//   }
// }

// class Datas {
//   Datas(this.expandincome, this.year);

//   final int year;
//   final String expandincome;
// }

import 'package:flutter/material.dart';
import 'package:project/model/add_data.dart';
import 'package:project/utility/utility.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart extends StatefulWidget {
  final int indexx;
  const Chart({Key? key, required this.indexx}) : super(key: key);

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  late List<add_data> chartdata;

  @override
  void initState() {
    super.initState();
    chartdata = [];
    updatechartdata();
  }

  @override
  void didUpdateWidget(covariant Chart oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.indexx != widget.indexx) {
      updatechartdata();
    }
  }

  void updatechartdata() {
    switch (widget.indexx) {
      case 0:
        chartdata = today();
        break;
      case 1:
        chartdata = week();
        break;
      case 2:
        chartdata = month();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    int income = calculateIncome(chartdata);
    int expense = calculateExpense(chartdata);
   
    return SfCircularChart(
      series: <CircularSeries>[
        DoughnutSeries<Datas, String>(
          dataSource: <Datas>[
            Datas('Income', income),
            Datas('Expense', expense),
          ],
          pointColorMapper: (Datas  data, _) =>
            data.expandincome == 'Income' ? Color.fromARGB(255, 3, 108, 21) : Color(0xFFED5449),
          xValueMapper: (Datas data, _) => data.expandincome,
          yValueMapper: (Datas data,_) => data.year,
          dataLabelSettings: DataLabelSettings(
            isVisible: true,
          )
        )
      ],
    );
  }
}

class Datas {
  Datas(this.expandincome, this.year);

  final int year;
  final String expandincome;
}
