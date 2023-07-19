import 'package:hive/hive.dart';
  part 'add_data.g.dart';

@HiveType(typeId: 1)
class add_data extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String select;

  @HiveField(2)
  DateTime dateTime;

  @HiveField(3)
  String amount;

  @HiveField(4)
  String discription;
  add_data(
      this.id,
      this.select,
       this.dateTime,
       this.amount,
      this.discription,
      
      );
}
