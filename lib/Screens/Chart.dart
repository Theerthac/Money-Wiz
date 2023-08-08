// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:project/model/add_data.dart';
import 'package:project/utility/utility.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart extends StatefulWidget {
  String username;
  final int indexx;
   Chart({Key? key, required this.indexx,required this.username}) : super(key: key);

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
    double income = calculateIncome(chartdata);
    double expense = calculateExpense(chartdata);

    return SfCircularChart(
      series: <CircularSeries>[
        DoughnutSeries<Datas, String>(
            dataSource: <Datas>[
              Datas('Income', income),
              Datas('Expense', expense),
            ],
            pointColorMapper: (Datas data, _) => data.expandincome == 'Income'
                ? const Color.fromARGB(255, 3, 108, 21)
                : const Color(0xFFED5449),
            xValueMapper: (Datas data, _) => data.expandincome,
            yValueMapper: (Datas data, _) => data.year,
            dataLabelSettings: const DataLabelSettings(
              isVisible: true,
            ))
      ],
    );
  }
}

class Datas {
  Datas(this.expandincome, this.year);

  final double year;
  final String expandincome;
}
