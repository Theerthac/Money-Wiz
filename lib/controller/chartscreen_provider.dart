import 'package:flutter/foundation.dart';
import 'package:project/utils/utility.dart';

import '../model/add_data.dart';

class ChartProvider extends ChangeNotifier {
  List<add_data> chartdata = [];
  double income = 0.0;
  double expense = 0.0;

  void updateChartData(List<add_data> data) {
    chartdata = data;
    income = UtilityProvider().calculateIncome(chartdata);
    expense = UtilityProvider().calculateExpense(chartdata);
    notifyListeners();
  }
}