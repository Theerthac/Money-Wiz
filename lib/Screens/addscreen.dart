
import 'package:flutter/material.dart';
import 'package:project/Screens/bottomscreen.dart';
import 'package:project/dbfunctions/db_functions.dart';
import 'package:project/model/add_data.dart';




class Add extends StatefulWidget {
  String username;
   Add({super.key ,required this.username});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  DateTime date = DateTime.now();
  String? selecteditems;

  final TextEditingController description_Controller = TextEditingController();
  final TextEditingController amount_Controller = TextEditingController();

  final List<String> _item = ['Income', 'Expense'];

  final GlobalKey<FormState> _FieldKey = GlobalKey<FormState>();

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
      child: Form(
        key: _FieldKey,
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
              setState(() {
                onaddbuttonclicked(context);
              });
            },
            icon: const Icon(Icons.add),
            label: const Text('Add'),
          ),
        ]),
      ),
    );
  }

  Padding description() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
          controller: description_Controller,
          decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              labelText: 'Description',
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
          controller: amount_Controller,
         
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

  Future<void> onaddbuttonclicked(BuildContext context) async {
    final selecttype = selecteditems.toString();
    final ddate = DateTime.now();
    final amount = double.parse(amount_Controller.text);
    final description = description_Controller.text.trim().toString();

    if (selecttype.isEmpty || amount == null || description.isEmpty) {
      return;
    } else {
      final llist = add_data(
        select: selecttype,
        dateTime: ddate,
        amount: amount,
        description: description,
      );

      addmoney(llist);

      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return Bottom(
          username: widget.username,
        );
      }));
    }
  }
}
