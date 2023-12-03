

import 'package:hive/hive.dart';
part 'add_data.g.dart';


@HiveType(typeId: 1)
class add_data extends HiveObject {

   @HiveField(0)
  String id;
  
  
  @HiveField(1)
  String select;

  @HiveField(2)
  DateTime dateTime;

  @HiveField(3)
  String amount;

  @HiveField(4)
  String description;

  add_data(
    this.select,
    this.dateTime,
    this.amount,
    this.description,
    this.id,
  );
}
