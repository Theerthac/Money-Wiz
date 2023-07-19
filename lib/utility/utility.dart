import 'package:hive_flutter/hive_flutter.dart';
import 'package:project/model/add_data.dart';

// final data = AddList[index];

final box = Hive.box<add_data>('data');

int total() {
  var history2 = box.values.toList();
  int totalamt = 0;

  for (var i = 0; i < history2.length; i++) {
    if (history2[i].select == 'Income') {
      totalamt += int.parse(history2[i].amount);
    } else
      totalamt -= (int.parse(history2[i].amount));
   
  }
  
  return totalamt;
}

int income() {
  var history2 = box.values.toList();
  int incomeamt = 0;

  for (var i = 0; i < history2.length; i++) {
    if (history2[i].select == 'Income') {
      incomeamt += int.parse(history2[i].amount);
    } else
      0;
  }

  return incomeamt;
}

int expenses() {
  var history2 = box.values.toList();
  int expensesamt = 0;
  for (var i = 0; i < history2.length; i++) {
    if (history2[i].select == 'Income') {
      0;
    } else
      expensesamt -= (int.parse(history2[i].amount));
  }

  return expensesamt;
}
