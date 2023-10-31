// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/controller/addscreen_provider.dart';
import 'package:project/controller/dbfunction_provider.dart';
import 'package:project/model/add_data.dart';
import 'package:provider/provider.dart';
import '../../widget/bottomscreen.dart';

class Add extends StatefulWidget {
  String username;
  Add({super.key, required this.username});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<AddScreenProvider>(context, listen: false)
          .resetselecteditems();
      Provider.of<AddScreenProvider>(context, listen: false).resetdate();
    });
  }

  @override
  void dispose() {
    descriptionController.dispose();
    amountController.dispose();
    super.dispose();
  }

  

  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  final List<String> _item = ['Income', 'Expense'];


  final GlobalKey<FormState> _fieldKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Expanded(
              flex: 1,
              
              child: Text('rfer'))
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

  Container mainContainer() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      width: 340,
      height: 550,
      child: Form(
        key: _fieldKey,
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
                  // ignore: unrelated_type_equality_checks
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
              setState(() {
                onAddButtonClicked(context);
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
          controller: descriptionController,
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
          controller: amountController,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
          ],
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
        }),
      ),
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


  Future<void> onAddButtonClicked(BuildContext context) async {
    final selecttype =
        Provider.of<AddScreenProvider>(context, listen: false).selecteditems;
    final ddate = Provider.of<AddScreenProvider>(context, listen: false).date;
    final amount = double.tryParse(amountController.text) ?? 0.0;
    final description = descriptionController.text.trim().toString();

    if (selecttype!.isEmpty || amount <= 0 || description.isEmpty) {
      return;
    } else {
      final dataToadd = add_data(
        select: selecttype,
        dateTime: ddate,
        amount: amount,
        description: description,
      );

      // addmoney(dataToadd);

      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return Bottom(
          username: widget.username,
        );
      }));
      Provider.of<DbfunctionProvider>(context, listen: false).addmoney(dataToadd);
    }
  }
}
