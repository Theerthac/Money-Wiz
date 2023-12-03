import 'package:flutter/material.dart';
import 'package:project/controller/addscreen_provider.dart';
import 'package:project/model/add_data.dart';
import 'package:project/view/transactionScreen/transactionScreen.dart';
import 'package:provider/provider.dart';
import '../../controller/dbfunction_provider.dart';

// ignore: must_be_immutable
class Edit_Data extends StatefulWidget {
  String username;
  var select;
  var date;
  var amount;
  var description;
  String id;

  Edit_Data({
    super.key,
    required this.username,
    required this.id,
    required this.select,
    required this.date,
    required this.amount,
    required this.description,
  });

  @override
  State<Edit_Data> createState() => _Edit_DataState();
}

class _Edit_DataState extends State<Edit_Data> {
  TextEditingController descriptionController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController selectController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  final List<String> _item = ['Income', 'Expense'];

  @override
  void initState() {
    super.initState();
    descriptionController = TextEditingController(text: widget.description);
    amountController = TextEditingController(text: widget.amount);
    Provider.of<AddScreenProvider>(context, listen: false).selecteditems =
        widget.select;

    Provider.of<AddScreenProvider>(context, listen: false).date = widget.date;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            backgroundContainer(context),
            Positioned(
              top: 120,
              child: mainContainer(),
            )
          ],
        )),
      ),
    );
  }

  Form mainContainer() {
    return Form(
      key: _formkey,
      child: Container(
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
            child:
                Consumer<AddScreenProvider>(builder: (context, value, child) {
              return TextButton(
                onPressed: () async {
                  DateTime? newDate = await showDatePicker(
                      context: context,
                      initialDate: value.date,
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2100));
                  if (newDate == Null) return;
                  value.changeDatevalue(newDate!);
                },
                child: Text(
                  'Date  :${value.date.year} /  ${value.date.day} / ${value.date.month}',
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              );
            }),
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
              onSaveUpadteButtonClicked();
              if (_formkey.currentState!.validate()) {
              } else {
                print('empty value');
              }
            },
            icon: const Icon(Icons.add),
            label: const Text('Update'),
          ),
        ]),
      ),
    );
  }

  Padding description() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
          controller: descriptionController,
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
          controller: amountController,
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
          child: Consumer<AddScreenProvider>(builder: (context, value, child) {
            return DropdownButton<String>(
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
              value: value.selecteditems,
              onChanged: (value) {
                Provider.of<AddScreenProvider>(context, listen: false)
                    .changeselecteditemvalue(value);
              },
            );
          })),
    );
  }

  Column backgroundContainer(BuildContext context) {
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

  // Future<void> updateAll() async {
  //   final edit =
  //       Provider.of<AddScreenProvider>(context, listen: false).selecteditems;
  //   final edit1 = Provider.of<AddScreenProvider>(context, listen: false).date;
  //   final edit2 = double.parse(amountController.text);
  //   final edit3 = descriptionController.text.trim().toString();

  //   if (edit!.isEmpty || edit2.isInfinite || edit3.isEmpty) {
  //     return;
  //   } else {
  //     final updation = add_data(
  //         select: edit, dateTime: edit1, amount: edit2, description: edit3);
  //     // editdata(widget.index, updation);
  //     Provider.of<DbfunctionProvider>(context, listen: false)
  //         .editdata(widget.index, updation);

  //     Navigator.of(context).push(MaterialPageRoute(
  //         builder: (context) => Bottom(
  //               username: widget.username,
  //             )));
  //   }
  // }

  Future<void> onSaveUpadteButtonClicked() async {
    final edit =
        Provider.of<AddScreenProvider>(context, listen: false).selecteditems;
    final edit1 = Provider.of<AddScreenProvider>(context, listen: false).date;
    final edit2 = amountController.text.trim();
    final edit3 = descriptionController.text.trim().toString();

    final _id = widget.id;

    if (edit!.isEmpty || edit2.isEmpty || edit3.isEmpty) {
      return;
    }
    if (_formkey.currentState!.validate()) {
      final updation = add_data(edit, edit1, edit2, edit3,_id);
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (ctx) => Transaction(
                username: widget.username,
              )));
      // updateTransaction( updation);
      Provider.of<DbfunctionProvider>(context, listen: false)
          .editData(updation);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green,
        content: Text('UPDATED'),
      ));
    } else {
      print('value empty');
    }
  }
}
