import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project/Screens/Bottom.dart';
import 'package:project/model/add_data.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:project/model/add_data.dart';

class Transaction extends StatefulWidget {
  const Transaction({super.key});

  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  var history;

  final Box = Hive.box<add_data>('data');

  GlobalKey<FormState> _FormKey = GlobalKey<FormState>();

  List<add_data> searchlist = [];

  TextEditingController SearchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchlist = Box.values.toList().cast<add_data>().reversed.toList();
  }

  void _filterTransactions(String query) {
    setState(() {
      searchlist = Box.values
          .cast<add_data>()
          .where((transaction) => transaction.discription
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList()
          .reversed
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
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
                    child: ValueListenableBuilder(
                        valueListenable: Box.listenable(),
                        builder: (context, value, child) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
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
                          );
                        }),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
             Container(
              margin: EdgeInsets.only(bottom: 20),
              width: 350,
              height: 48,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: TextFormField(
                onChanged: _filterTransactions,
                controller: SearchController,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    contentPadding: EdgeInsets.only(bottom: 20),
                    hintText: 'Search',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 30),
            //   child: AnimSearchBar(
            //     width: 400,
            //     textController: SearchController,
            //     onSuffixTap: () {
            //       setState(() {
            //         SearchController.clear();
            //          _filterTransactions(" ");
            //       });
            //     },
            //     onSubmitted: _filterTransactions
            //   ),
            // ),
            Expanded(
                child: searchlist.length == 0
                    ? Center(
                        child: Text(
                          "Now result found",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    : ListView.builder(
                        itemCount: Box.length,
                        itemBuilder: (BuildContext context, int index) {
                          history = Box.values.toList()[index];
                          return Slidable(
                              key: UniqueKey(),
                              startActionPane: ActionPane(
                                  dismissible: DismissiblePane(onDismissed: () {
                                    setState(() {
                                      history.delete();
                                    });
                                  }),
                                  motion: BehindMotion(),
                                  children: [
                                    SlidableAction(
                                      label: 'Delete',
                                      icon: Icons.delete,
                                      backgroundColor: Colors.red,
                                      onPressed: (direction) {
                                        setState(() {
                                          history.delete();
                                        });
                                      },
                                    ),
                                  ]),
                              child: get(index, history));
                        })),
          ])
        ],
      )),
    );
  }

  ListTile get(int index, add_data history) {
    return ListTile(
        title: Text(
          history.discription,
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w700,
          ),
        ),
        subtitle: Text(
          '  ${history.dateTime.year}-${history.dateTime.day}-${history.dateTime.month}',
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        trailing: Row(mainAxisSize: MainAxisSize.min, children: [
          Text(
            history.amount,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: history.select == 'Income' ? Colors.green : Colors.red),
          ),
          SizedBox(width: 20),
          IconButton(
              onPressed: () async {
                await showInformationDialog(context);
              },
              icon: Icon(
                Icons.edit,
                color: Colors.green,
              )),
        ]));
  }

  Future<void> showInformationDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          final TextEditingController _discriptionController =
              TextEditingController();
          final TextEditingController _amountController =
              TextEditingController();

          return StatefulBuilder(builder: (context, SetState) {
            return AlertDialog(
              content: Form(
                key: _FormKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: _discriptionController,
                      validator: (value) {
                        return value!.isNotEmpty ? null : 'Invalid field';
                      },
                      decoration: InputDecoration(hintText: 'Discription'),
                    ),
                    TextFormField(
                      controller: _amountController,
                      validator: (value) {
                        return value!.isNotEmpty ? null : 'Invalid field';
                      },
                      decoration: InputDecoration(hintText: 'Amount'),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('okay'),
                  onPressed: () {
                    if (_FormKey.currentState!.validate()) {
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            );
          });
        });
  }
}
