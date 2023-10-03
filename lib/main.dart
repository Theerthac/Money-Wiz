// ignore_for_file: constant_identifier_names



import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:project/controller/addscreen_provider.dart';
import 'package:project/controller/chartscreen_provider.dart';
import 'package:project/controller/dbfunction_provider.dart';
import 'package:project/controller/statistic_provider.dart';
import 'package:project/model/add_data.dart';
import 'package:provider/provider.dart';
import 'view/splash/splash.dart';

const Save_Key = 'User LoggedIn';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(adddataAdapter());
  await Hive.openBox<add_data>('data');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => AddScreenProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => DbfunctionProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => StatisticsProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => ChartProvider(),
        )
      ],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false, home: SplashScreen()),
    );
  }
}
