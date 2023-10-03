
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:project/model/add_data.dart';
import 'package:project/utils/utility.dart';

import '../chart/chart.dart';

class Statistics extends StatelessWidget {
  final String username;

  const Statistics({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StatisticsProvider(),
      child: Consumer<StatisticsProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            body: SafeArea(
              child: ValueListenableBuilder<int>(
                valueListenable: provider.kj,
                builder: (context, value, child) {
                  provider.updateData(value);

                  return CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Statistics',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ...List.generate(3, (index) {
                                    return GestureDetector(
                                      onTap: () {
                                        provider.setIndexColor(index);
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: provider.indexColor == index
                                              ? const Color(0xFFFDC603)
                                              : Colors.white,
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                          provider.day[index],
                                          style: TextStyle(
                                            color: provider.indexColor == index
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: 400,
                              height: 400,
                              child: Chart(
                                indexx: provider.indexColor,
                                username: username,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class StatisticsProvider extends ChangeNotifier {
  ValueNotifier<int> kj = ValueNotifier(0);
  int indexColor = 0;

  List<String> day = ['Day', 'Week', 'Month'];
  List<List<add_data>> data = [UtilityProvider().today(), UtilityProvider().week(), UtilityProvider().month()];

  void setIndexColor(int index) {
    indexColor = index;
    kj.value = index;
    notifyListeners();
  }

  void updateData(int value) {
    data[value] = data[value].reversed.toList();
  }
}