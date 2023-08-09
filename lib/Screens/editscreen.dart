// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:project/Screens/bottomscreen.dart';
import 'package:project/model/add_data.dart';

import '../dbfunctions/db_functions.dart';



class Edit_Data extends StatefulWidget {
  String username;
  var select;
  var date;
  var amount;
  var description;
  late int index;

  Edit_Data({
    super.key,
    required this.username,
    required this.index,
    required this.select,
    required this.date,
    required this.amount,
    required this.description,
  });

  @override
  State<Edit_Data> createState() => _Edit_DataState();
}

class _Edit_DataState extends State<Edit_Data> {
  DateTime date = DateTime.now();
  String? selecteditems;

  final TextEditingController Discription_controller = TextEditingController();
  final TextEditingController Amount_controller = TextEditingController();
  final TextEditingController Date_controller = TextEditingController();
  final TextEditingController Select_controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    // final Amount_controller = TextEditingController(text: widget.select);
    // final Discription_controller = TextEditingController(text: widget.select);
  }

  final List<String> _item = ['Income', 'Expense'];
  @override
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
      child: Column(children: [
        const SizedBox(
          height: 50,
        ),
        name(),
        const SizedBox(
          height: 30,
        ),
        Container(
          alignment: Alignment.bottomLeft,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  width: 2, color: const Color.fromARGB(255, 182, 181, 181))),
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
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        amount(),
        const SizedBox(
          height: 30,
        ),
        description(),
        const SizedBox(
          height: 30,
        ),
        ElevatedButton.icon(
          onPressed: () {
            updateall();
          },
          icon: const Icon(Icons.add),
          label: const Text('Update'),
        ),
      ]),
    );
  }

  Padding description() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
          controller: Discription_controller,
          decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              labelText: 'Discription',
              labelStyle: const TextStyle(
                  fontSize: 17, color: Color.fromARGB(255, 74, 73, 73)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                    width: 2, color: Color.fromARGB(255, 182, 181, 181)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                    width: 2, color: Color.fromARGB(255, 182, 181, 181)),
              ))),
    );
  }

  Padding amount() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
          keyboardType: TextInputType.number,
          controller: Amount_controller,
          decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              labelText: 'Amount',
              labelStyle: const TextStyle(
                  fontSize: 17, color: Color.fromARGB(255, 74, 73, 73)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                    width: 2, color: Color.fromARGB(255, 182, 181, 181)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                    width: 2, color: Color.fromARGB(255, 182, 181, 181)),
              ))),
    );
  }

  Padding name() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          width: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 2,
                color: const Color.fromARGB(255, 208, 205, 205),
              )),
          child: DropdownButton<String>(
            items: _item
                .map((e) => DropdownMenuItem(
                      child: Container(
                        child: Text(
                          e,
                          style: const TextStyle(fontSize: 17),
                        ),
                      ),
                      value: e,
                    ))
                .toList(),
            hint: const Text(
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
          decoration: const BoxDecoration(
              color: Color(0xFFFDC603),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          child: Column(
            children: [
              const SizedBox(
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
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      width: 60,
                    ),
                    const Text(
                      'Edit Transaction',
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

  Future<void> updateall() async {
    final edit = selecteditems.toString();
    final edit1 = DateTime.now();
    final edit2 = double.parse(Amount_controller.text);
    final edit3 = Discription_controller.text.trim();

    if (edit.isEmpty || edit2 == null || edit3.isEmpty) {
      return;
    } else {
      final updation =
          add_data(select: edit, dateTime: edit1, amount: edit2, description: edit3);
      editdata(widget.index, updation);
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Bottom(
                username: widget.username,
              )));
    }
  }
}
