import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project/DB/DB.dart';
import 'package:project/Screens/Transaction.dart';
import 'package:project/model/add_data.dart';
import 'package:project/utility/utility.dart';

class Home extends StatefulWidget {
  // String username;
  Home({super.key ,});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    getAlldata();
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      Column(
        children: [
          Container(
            width: double.infinity,
            height: 240,
            decoration: BoxDecoration(
                color: Color(0xFFFDC603),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Padding(
              padding: const EdgeInsets.only(top: 30, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome',
                    // 'Hey ${widget.username}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      Positioned(
        top: 140,
        left: 28,
        child: Container(
          height: 170,
          width: 320,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.amber.shade300,
                offset: Offset(0, 6),
                blurRadius: 12,
                spreadRadius: 6,
              )
            ],
            color: Color(0xFFFCFF5B),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
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
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Text(
                      '\$ ${total()}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 7),
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
              SizedBox(
                height: 6,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$ ${income()}',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      '\$ ${expense()}',
                      style: TextStyle(
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
              child: ValueListenableBuilder(
                valueListenable: addListNotifier,
                builder: (context, value, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
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
                              return Transaction();
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
                  );
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: addListNotifier,
                builder:
                    (BuildContext ctx, List<add_data> AddList, Widget? child) {
                  return ListView.separated(
                    itemBuilder: (ctx, index) {
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
                    },
                    separatorBuilder: (ctx, index) {
                      return Divider();
                    },
                    itemCount: AddList.length > 4 ? 4 : AddList.length,
                  );
                },
              ),
            )
          ]))
    ])));
  }
}
