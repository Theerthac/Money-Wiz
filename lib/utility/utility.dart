import 'package:hive/hive.dart';
import 'package:project/model/add_data.dart';

final box = Hive.box<add_data>('data');

class IncomeExp{
   
int totals=0;
final box = Hive.box<add_data>('add_DB');
int total(){
  var history2=box.values.toList();
  List a=[0,0];
  for(var i=0;i<history2.length;i++){
    a.add(history2[i].select=='Income'
    ? int.parse(history2[i].amount)
    : int.parse(history2[i].amount)* -1 );
  }
  totals=a.reduce((value, element) => value+element);
  return totals;
}





int income(){
  final box = Hive.box<add_data>('add_DB');
  var history2=box.values.toList();
  List a=[0,0];
  for(var i=0;i<history2.length;i++){
    a.add(history2[i].select=='Income'
    ? int.parse(history2[i].amount):0 );
  }
  totals=a.reduce((value, element) => value+element);
  return totals;
}



int expense(){
  final box = Hive.box<add_data>('add_DB');
  var history2=box.values.toList();
  List a=[0,0];
  for(var i=0;i<history2.length;i++){
    a.add(history2[i].select=='Income'? 0:int.parse(history2[i].amount)* -1 );
  }
  totals=a.reduce((value, element) => value+element);
  return totals;
}

}



// class IncomeExp {
//   final box = Hive.box<add_data>('data');
//   int total() {
//     var history2 = box.values.toList();
//     int totalamt = 0;

//     for (var i = 0; i < history2.length; i++) {
//       if (history2[i].select == 'Income') {
//         totalamt += int.parse(history2[i].amount);
//       } else {
//         totalamt -= (int.parse(history2[i].amount));
//       }
//     }

//     return totalamt;
//   }

//   int income() {
//     var history2 = box.values.toList();
//     int incomeamt = 0;

//     for (var i = 0; i < history2.length; i++) {
//       if (history2[i].select == 'Income') {
//         incomeamt += int.parse(history2[i].amount);
//       } else {
//         0;
//       }
//     }

//     return incomeamt;
//   }

//   int expenses() {
//     var history2 = box.values.toList();
//     int expensesamt = 0;
//     for (var i = 0; i < history2.length; i++) {
//       if (history2[i].select == 'Income') {
//         0;
//       } else {
//         expensesamt -= (int.parse(history2[i].amount));
//       }
//     }

//     return expensesamt;
//   }





 