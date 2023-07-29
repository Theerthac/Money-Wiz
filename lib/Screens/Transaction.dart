
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project/Screens/Bottom.dart';
import 'package:project/Screens/Edit.dart';
import 'package:project/Screens/Search.dart';
import 'package:project/model/add_data.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:project/utility/utility.dart';
import '../DB/DB.dart';

class Transaction extends StatefulWidget {
  const Transaction({super.key});

  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
   final box = Hive.box<add_data>('data');


  @override
  Widget build(BuildContext context) {
    getAlldata();
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      Column(children: [
        Container(
          width: double.infinity,
          height: 141,
          decoration: BoxDecoration(
              color: Color(0xFFFDC603),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              )),
          child: Column(
            children: [
              SizedBox(
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
                                return Bottom();
                              },
                            ));
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          )),
                      Text(
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
        SizedBox(
          height: 20,
        ),

        IconButton(
            onPressed: () {
              showSearch(context: context, delegate: search());
            },
            icon: const Icon(Icons.search)),


        Expanded(
          child: ValueListenableBuilder(
            valueListenable: addListNotifier,
            builder: (BuildContext ctx, List<add_data> AddList, Widget? child) {
              return ListView.separated(
                  itemBuilder: (context, index) {
                    final data = AddList[index];
                    return Slidable(
                      key: UniqueKey(),
                      startActionPane: ActionPane(
                          dismissible: DismissiblePane(
                            onDismissed: () {
                              setState(() {
                                deletedata(index);
                              });
                            },
                          ),
                          motion: BehindMotion(),
                          children: [
                            SlidableAction(
                              label: 'Delete',
                              icon: Icons.delete,
                              backgroundColor: Colors.red,
                              onPressed: (context) {
                                setState(() {
                                  deletedata(index);
                                  IncomeExp();
                                });
                              },
                            )
                          ]),
                      child: ListTile(
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
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                data.amount,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: data.select == 'Income'
                                        ? Colors.green
                                        : Colors.red),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) => Edit_Data(
                                              index: index,
                                              select: data.select,
                                              date:
                                                  '  ${data.dateTime.year}-${data.dateTime.day}-${data.dateTime.month}',
                                              amount: data.amount,
                                              discription: data.description)));

                                      IncomeExp();
                                    });
                                  },
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.green,
                                  ))
                            ],
                          )),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: AddList.length);
            },
          ),
        )
      ])
    ])));
  }
}
