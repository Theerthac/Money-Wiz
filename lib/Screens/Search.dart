import 'package:flutter/material.dart';
import '../DB/DB.dart';
import '../model/add_data.dart';

class search extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        onPressed: (() {
          query = "";
        }),
        icon: const Icon(Icons.cancel_rounded),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: (() {
        close(context, query);
      }),
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: addListNotifier,
        builder: (BuildContext ctx, List<add_data> AddList, Widget? child) {
          return (AddList.isEmpty)
              ? const Center(
                  child: Text('No data found'),
                )
              : ListView.separated(
                  itemBuilder: (ctx, index) {
                    final data = AddList.toSet().toList()[index];

                    if (data.select
                            .toLowerCase()
                            .contains(query.toLowerCase()) ||
                        data.amount
                            .toString()
                            .toLowerCase()
                            .contains(query.toLowerCase()) ||
                        data.description
                            .toLowerCase()
                            .contains(query.toLowerCase())) {
                      final data = AddList[index];
                      return ListTile(
                          title: Text(
                            data.description,
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          subtitle: Text(
                            '  ${data.dateTime.year}-${data.dateTime.day}-${data.dateTime.month}',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          trailing: Text(
                            data.amount.toString(),
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: data.select == 'Income'
                                    ? Colors.green
                                    : Colors.red),
                          ));
                    } else {
                      const Text(
                        'No data found',
                        style: TextStyle(color: Colors.black),
                      );
                      return const SizedBox();
                    }
                  },
                  separatorBuilder: (ctx, index) {
                    return Divider();
                  },
                  itemCount: AddList.length,
                );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: addListNotifier,
        builder: (BuildContext ctx, List<add_data> AddList, Widget? child) {
          return (AddList.isEmpty)
              ? const Center(
                  child: Text('No data found'),
                )
              : ListView.separated(
                  itemBuilder: (context, index) {
                    final data = AddList.toList()[index];
                    if (data.select
                            .toLowerCase()
                            .contains(query.toLowerCase()) ||
                        data.amount.toString()
                            .toLowerCase()
                            .contains(query.toLowerCase()) ||
                        data.description
                            .toLowerCase()
                            .contains(query.toLowerCase())) {
                      final data = AddList[index];
                      return ListTile(
                          title: Text(
                            data.description,
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          subtitle: Text(
                            '  ${data.dateTime.year}-${data.dateTime.day}-${data.dateTime.month}',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          trailing: Text(
                            data.amount.toString(),
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: data.select == 'Income'
                                    ? Colors.green
                                    : Colors.red),
                          ));
                    } else {
                      return const SizedBox();
                    }
                  },
                  separatorBuilder: (ctx, index) {
                    return Divider();
                  },
                  itemCount: AddList.length);
        });
  }
}
