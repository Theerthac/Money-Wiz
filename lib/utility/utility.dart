import 'package:hive/hive.dart';
import 'package:project/model/add_data.dart';


num totals = 0;
final box = Hive.box<add_data>('data');
num total() {
  var history2 = box.values.toList();

  List a = [0, 0];
  for (var i = 0; i < history2.length; i++) {
    a.add(history2[i].select == 'Income'
        ? totals = double.parse(history2[i].amount.toString())
        : totals = double.parse(history2[i].amount.toString()) * -1);
  }


  totals =  a.reduce((value, element) => value + element);
  return totals;
}

num income() {
  final box = Hive.box<add_data>('data');
  var history2 = box.values.toList();
  List a = [0, 0];
  for (var i = 0; i < history2.length; i++) {
    a.add(history2[i].select == 'Income'
        ? double.parse(history2[i].amount.toString())
        : 0);
  }
  totals = a.reduce((value, element) => value + element);
  return totals;
}

num expense() {
  final box = Hive.box<add_data>('data');
  var history2 = box.values.toList();
  List a = [0, 0];
  for (var i = 0; i < history2.length; i++) {
    a.add(history2[i].select == 'Income'
        ? 0
        : double.parse(history2[i].amount.toString()) * -1);
  }
  totals = a.reduce((value, element) => value + element);
  return totals;
}

List<add_data> today() {
  List<add_data> a = [];
  var history2 = box.values.toList();
  DateTime date = DateTime.now();
  for (var i = 0; i < history2.length; i++) {
    if (history2[i].dateTime.day == date.day) {
      a.add(history2[i]);
    }
  }
  return a;
}

List<add_data> week() {
  List<add_data> a = [];
  DateTime date = DateTime.now();
  var history2 = box.values.toList();

  for (var i = 0; i < history2.length; i++) {
    if (date.day - 7 <= history2[i].dateTime.day &&
        history2[i].dateTime.day <= date.day) {
      a.add(history2[i]);
    }
  }
  return a;
}

List<add_data> month() {
  List<add_data> a = [];
  var history2 = box.values.toList();
  DateTime date = DateTime.now();
  for (var i = 0; i < history2.length; i++) {
    if (history2[i].dateTime.month == date.month) {
      a.add(history2[i]);
    }
  }
  return a;
}

num total_chart(List<add_data> history2) {
  List a = [0, 0];
  for (var i = 0; i < history2.length; i++) {
    a.add(history2[i].select == 'Income'
        ? double.parse(history2[i].amount.toString())
        : double.parse(history2[i].amount.toString()) * -1);
  }
  totals = a.reduce((value, element) => value + element);
  return totals;
}

List time(List<add_data> history2, bool hour) {
  List<add_data> a = [];
  List total = [0, 0];
  int counter = 0;
  for (var c = 0; c < history2.length; c++) {
    for (var i = c; i < history2.length; i++) {
      if (hour) {
        if (history2[i].dateTime.hour == history2[c].dateTime.hour) {
          a.add(history2[i]);
          counter = i;
        }
      } else {
        if (history2[i].dateTime.day == history2[c].dateTime.day) {
          a.add(history2[i]);
          counter = i;
        }
      }
    }
    total.add(total_chart(a));
    a.clear();
    c = counter;
  }
  return total;
}

double calculateIncome(List<add_data> chartdata) {
  double income = 0;
  for (var transaction in chartdata) {
    if (transaction.select == 'Income') {
      income += double.parse(transaction.amount.toString());
    }
  }
  return income;
}

double calculateExpense(List<add_data> chartdata) {
  double expense = 0;
  for (var transaction in chartdata) {
    if (transaction.select != 'Income') {
      expense += double.parse(transaction.amount.toString());
    }
  }
  return expense;
}
