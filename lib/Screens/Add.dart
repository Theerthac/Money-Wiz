import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:hive/hive.dart';
import 'package:project/DB/DB.dart';
import 'package:project/Screens/Bottom.dart';
import 'package:project/Screens/Home.dart';
import 'package:project/Screens/Transaction.dart';
import 'package:project/model/add_data.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  //final box = Hive.box<add_data>('data');

  DateTime date = DateTime.now();
  String? selecteditems;

  final TextEditingController Amount_controller = TextEditingController();
  final TextEditingController Discription_controller = TextEditingController();
  final TextEditingController Date_controller = TextEditingController();
  final TextEditingController Select_controller = TextEditingController();
  final List<String> _item = ['Income', 'Expense'];
  GlobalKey<FormState> _FieldKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            background_container(context),
            Positioned(
              top: 120,
              child: main_container(),
            )
          ],
        )),
      ),
    );
  }

  Container main_container() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      width: 340,
      height: 550,
      child: Form(
        key: _FieldKey,
        child: Column(children: [
          SizedBox(
            height: 50,
          ),
          name(),
          SizedBox(
            height: 30,
          ),
          Container(
            alignment: Alignment.bottomLeft,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    width: 2, color: Color.fromARGB(255, 182, 181, 181))),
            width: 300,
            child: TextButton(
              onPressed: () async {
                DateTime? newDate = await showDatePicker(
                    context: context,
                    initialDate: date,
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2100));
                if (newDate == Null) return;
                setState(() {
                  date = newDate!;
                });
              },
              child: Text(
                'Date  :${date.year} /  ${date.day} / ${date.month}',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Amount(),
          SizedBox(
            height: 30,
          ),
          Discription(),
          SizedBox(
            height: 30,
          ),
          ElevatedButton.icon(
            onPressed: () {
             onAdddButtonClicked(context);
              
              // var add = add_data(selecteditems!, date, Amount_controller.text,
              //     Discription_controller.text);
              // box.add(add);
              // if (_FieldKey.currentState!.validate()) {
              //   Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) {
              //       return Home();
              //     },
              //   ));
              // }
            },
            icon: Icon(Icons.add),
            label: Text('Add'),
          ),
        ]),
      ),
    );
  }

  Padding Discription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
          keyboardType: TextInputType.number,
          controller: Discription_controller,
          // validator: (value) {
          //   return value!.isNotEmpty ? null : 'Invalid field';
          // },
          decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              labelText: 'Discription',
              labelStyle: TextStyle(
                  fontSize: 17, color: Color.fromARGB(255, 74, 73, 73)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                    width: 2, color: Color.fromARGB(255, 182, 181, 181)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                    width: 2, color: Color.fromARGB(255, 182, 181, 181)),
              ))),
    );
  }

  Padding Amount() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
          keyboardType: TextInputType.number,
          controller: Amount_controller,
          // validator: (value) {
          //   return value!.isNotEmpty ? null : 'Invalid field';
          // },
          decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              labelText: 'Amount',
              labelStyle: TextStyle(
                  fontSize: 17, color: Color.fromARGB(255, 74, 73, 73)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                    width: 2, color: Color.fromARGB(255, 182, 181, 181)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                    width: 2, color: Color.fromARGB(255, 182, 181, 181)),
              ))),
    );
  }

  Padding name() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          width: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 2,
                color: Color.fromARGB(255, 208, 205, 205),
              )),
          child: DropdownButton<String>(
            items: _item
                .map((e) => DropdownMenuItem(
                      child: Container(
                        child: Text(
                          e,
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                      value: e,
                    ))
                .toList(),
            hint: Text(
              'Select',
              style: TextStyle(color: Colors.grey),
            ),
            dropdownColor: Colors.white,
            isExpanded: true,
            underline: Container(),
            value: selecteditems,
            onChanged: ((value) {
              setState(() {
                selecteditems = value!;
              });
            }),
          )),
    );
  }

  Column background_container(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: BoxDecoration(
              color: Color(0xFFFDC603),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    Text(
                      'Add Transactions',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Future<void> onAdddButtonClicked(BuildContext context) async {
    final _discription = Discription_controller.text.trim().toString();
    final _amount = Amount_controller.text.trim().toString();
    final _date = date;
    final _selecttype = selecteditems;
    final _id = DateTime.now().microsecondsSinceEpoch;
    if (_discription.isEmpty || _amount.isEmpty || _selecttype!.isEmpty) {
      return;
    }

    final lst = add_data(
     _id,_selecttype,_date,_amount,_discription

       );
    //print('$select $date $amount $Discription_controller');
    AdddMoney(lst);

    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) {
        return Bottom();
      },
    ));
  }
}
