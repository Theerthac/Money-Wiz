import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart extends StatefulWidget {
  const Chart({super.key});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  late List<Datas> _chartdata;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartdata = getchartDatas();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SfCircularChart(
        
        legend:
            Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
            tooltipBehavior: _tooltipBehavior,
            
        series: <CircularSeries>[
          
          DoughnutSeries<Datas, String>(
            
              dataSource: _chartdata,
              
              xValueMapper: (Datas data, _) => data.expandincome ,
              yValueMapper: (Datas data, _) => data.month,
               
              dataLabelSettings: DataLabelSettings(
                isVisible: true,
              ),
              enableTooltip: true)
        ],
      ),
    ));
  }

  List<Datas> getchartDatas() {
    final List<Datas> chartdata = [
      
      Datas('Income' , 2000 ,),
      Datas('Expenses', 1000),
      
    ];
    return chartdata;
  }
}

class Datas {
  Datas(this.expandincome, this.month);

  final int month;
  final String expandincome;
}
