// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:project/utils/utility.dart';
import 'package:provider/provider.dart';
import '../../controller/dbfunction_provider.dart';
import '../transactionScreen/transactionScreen.dart';

class Home extends StatefulWidget {
  String username;
  Home({super.key, required this.username});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    Provider.of<DbfunctionProvider>(context, listen: false).getalldata();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // getalldata();
    return Scaffold(
      
        body: SafeArea(
            child: Stack(children: [
      Column(
        children: [
          Container(
            width: size.width,
            height: size.height * 0.35,
            decoration: const BoxDecoration(
                color: Color(0xFFFDC603),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Padding(
              padding: const EdgeInsets.only(top: 30, left: 20),
              child: Consumer(builder: (context, value, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hey ${widget.username}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    )
                  ],
                );
              }),
            ),
          ),
        ],
      ),
      Positioned(
        top: 120,
        left: 20,
        child: Container(
          height: size.height * 0.25,
          width: size.width * 0.9,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.amber.shade300,
                offset: const Offset(0, 6),
                blurRadius: 12,
                spreadRadius: 6,
              ),
            ],
            color: const Color(0xFFFCFF5B),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const Row(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '  Total Balance',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Text(
                      '\$${UtilityProvider().total()}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 7, top: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.arrow_downward,
                          color: Colors.green,
                          size: 22,
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          'Income',
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w500,
                              color: Colors.green),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.arrow_upward,
                          color: Colors.red,
                          size: 22,
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          'Expenses  ',
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w500,
                              color: Colors.red),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$ ${UtilityProvider().income()}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      '\$ ${UtilityProvider().expense()}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      Padding(
          padding: const EdgeInsets.only(top: 350),
          child: Column(children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Transactions History',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return Transaction(
                              username: widget.username,
                            );
                          },
                        ));
                      },
                      child: Text(
                        'See all',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    )
                  ],
                ))
          ])),
      const SizedBox(
        height: 30,
      ),
      Expanded(
        child: (Provider.of<DbfunctionProvider>(context)
                .transactionList
                .isEmpty)
            ? const Padding(
                padding: EdgeInsets.only(left: 95, top: 500),
                child: Text(
                  'No transactions available',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(top: 400),
                child: ListView.separated(
                    itemBuilder: (ctx, index) {
                      final data = Provider.of<DbfunctionProvider>(context)
                          .transactionList
                          .reversed
                          .toList()[index];
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
                    },
                    separatorBuilder: (ctx, index) {
                      return const Divider();
                    },
                    itemCount: Provider.of<DbfunctionProvider>(context)
                                .transactionList
                                .length >
                            4
                        ? 4
                        : Provider.of<DbfunctionProvider>(context)
                            .transactionList
                            .length),
              ),
      ),
    ])));
  }
}
