import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/dbfunction_provider.dart';

class Search extends SearchDelegate {
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
    return Consumer<DbfunctionProvider>(builder: (context, value, child) {
      return (value.transactionList.isEmpty)
          ? const Center(
              child: Text('No data found'),
            )
          : ListView.separated(
              itemBuilder: (ctx, index) {
                final data =
                    value.transactionList.reversed.toSet().toList()[index];
                if (data.select.toLowerCase().contains(query.toLowerCase()) ||
                    data.amount
                        .toString()
                        .toLowerCase()
                        .contains(query.toLowerCase()) ||
                    data.description
                        .toLowerCase()
                        .contains(query.toLowerCase())) {
                 
                  return ListTile(
                      title: Text(
                        data.description,
                        style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      subtitle: Text(
                        '  ${data.dateTime.year}-${data.dateTime.day}-${data.dateTime.month}',
                        style: const TextStyle(
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
                return const Divider();
              },
              itemCount: value.transactionList.length,
            );
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Consumer<DbfunctionProvider>(builder: (context, value, child) {
      return (value.transactionList.isEmpty)
          ? const Center(
              child: Text('No data found'),
            )
          : ListView.separated(
              itemBuilder: (context, index) {
                final data =
                    value.transactionList.reversed.toSet().toList()[index];
                if (data.select.toLowerCase().contains(query.toLowerCase()) ||
                    data.amount
                        .toString()
                        .toLowerCase()
                        .contains(query.toLowerCase()) ||
                    data.description
                        .toLowerCase()
                        .contains(query.toLowerCase())) {
                
                  return ListTile(
                      title: Text(
                        data.description,
                        style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      subtitle: Text(
                        '  ${data.dateTime.year}-${data.dateTime.day}-${data.dateTime.month}',
                        style: const TextStyle(
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
                return const Divider();
              },
              itemCount: value.transactionList.length,
              );
    });
  }
}
