

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../controller/chartscreen_provider.dart';
import '../../utils/utility.dart';
import '../../model/add_data.dart';

// ignore: must_be_immutable
class Chart extends StatefulWidget {
   String username;
   final int indexx;
    Chart({Key? key, required this.indexx,required this.username}) : super(key: key);

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  late ChartProvider _chartProvider;

  @override
  void initState() {
    super.initState();
    _chartProvider = Provider.of<ChartProvider>(context, listen: false);
    updateChartdata();
  }

  void updateChartdata() {
    List<add_data> data;
    switch (widget.indexx) {
      case 0:
        data = UtilityProvider().today();
        break;
      case 1:
        data = UtilityProvider().week();
        break;
      case 2:
        data = UtilityProvider().month();
        break;
      default:
        data = [];
    }

    _chartProvider.updateChartData(data);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _chartProvider,
      child: _buildChartContent(),
    );
  }

  Widget _buildChartContent() {
    final chartProvider = Provider.of<ChartProvider>(context);

    double income = chartProvider.income;
    double expense = chartProvider.expense;

    return SfCircularChart(
      series: <CircularSeries>[
        DoughnutSeries<Datas, String>(
          dataSource: <Datas>[
            Datas('Income', income),
            Datas('Expense', expense),
          ],
          pointColorMapper: (Datas data, _) =>
              data.expandincome == 'Income'
                  ? const Color.fromARGB(255, 3, 108, 21)
                  : const Color(0xFFED5449),
          xValueMapper: (Datas data, _) => data.expandincome,
          yValueMapper: (Datas data, _) => data.year,
          dataLabelSettings: const DataLabelSettings(
            isVisible: true,
          ),
        ),
      ],
    );
  }
}

class Datas {
  Datas(this.expandincome, this.year);

  final double year;
  final String expandincome;

}
