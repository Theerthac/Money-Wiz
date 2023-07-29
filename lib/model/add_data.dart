import 'package:hive/hive.dart';
part 'add_data.g.dart';

@HiveType(typeId: 1)
class add_data extends HiveObject {
  
  
  @HiveField(0)
  String select;

  @HiveField(1)
  DateTime dateTime;

  @HiveField(2)
  String amount;

  @HiveField(3)
  String description;

  add_data({
    
    required this.select,
    required this.dateTime,
    required this.amount,
    required this.description,
  });
}
