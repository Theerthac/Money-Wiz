// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project/controller/dbfunction_provider.dart';
import 'package:project/model/add_data.dart';
import 'package:provider/provider.dart';
import '../../widget/bottomscreen.dart';
import '../search/search.dart';
import '../editScreen/editScreen.dart';

class Transaction extends StatelessWidget {
  String username;
  Transaction({super.key, required this.username});

  final box = Hive.box<add_data>('data');

  @override
  Widget build(BuildContext context) {
    // getalldata();
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      Column(children: [
        Container(
          width: double.infinity,
          height: 141,
          decoration: const BoxDecoration(
              color: Color(0xFFFDC603),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              )),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return Bottom(
                                  username: username,
                                );
                              },
                            ));
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          )),
                      const Text(
                        '     Transaction Histrory',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      )
                    ],
                  )),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        IconButton(
            onPressed: () {
              showSearch(context: context, delegate: Search());
            },
            icon: const Icon(Icons.search)),
        Consumer<DbfunctionProvider>(
          builder: (context, value, child) {
          return (value.transactionList.isEmpty)
              ? const Text('No transactions available',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
              : Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      final data = value.transactionList.reversed.toList()[index];
                      return Slidable(
                        key: UniqueKey(),
                        startActionPane: ActionPane(
                            dismissible: DismissiblePane(
                              onDismissed: () {
                                Provider.of<DbfunctionProvider>(context,
                                        listen: false)
                                    .deletedata(index);
                              },
                            ),
                            motion: const BehindMotion(),
                            children: [
                              SlidableAction(
                                label: 'Delete',
                                icon: Icons.delete,
                                backgroundColor: Colors.red,
                                onPressed: (context) {
                                  Provider.of<DbfunctionProvider>(context,
                                          listen: false)
                                      .deletedata(index);
                                },
                              )
                            ]),
                        child: ListTile(
                            title: Text(
                              data.description.toString(),
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
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  data.amount.toString(),
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                      color: data.select == 'Income'
                                          ? Colors.green
                                          : Colors.red),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                IconButton(
                                    onPressed: () {
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) => Edit_Data(
                                              username: username,
                                              index: index,
                                              select: data.select,
                                              date: DateTime(data.dateTime.year, data.dateTime.month, data.dateTime.day),
                                                 
                                              amount: data.amount.toString(),
                                              description: data.description.toString())));
                                    },
                                    icon: const Icon(
                                      Icons.edit,
                                      color: Colors.green,
                                    )),

                   
 

                              ],
                            )),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemCount: value.transactionList.length,
                  ),
              );
        }),
      ])
    ])));
  }
}
