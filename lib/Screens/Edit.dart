import 'package:flutter/material.dart';
import 'package:project/Screens/Bottom.dart';
import '../DB/DB.dart';
import '../model/add_data.dart';

class Edit_Data extends StatefulWidget {
  var select;
  var date;
  var amount;
  var discription;
   late int index;

  Edit_Data({
    required this.index,
    required this.select,
    required this.date,
    required this.amount,
    required this.discription,
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
  
  final Amount_controller = TextEditingController(text: widget.select);
  final Discription_controller = TextEditingController(text: widget.select);

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
            Updateall();
          },
          icon: Icon(Icons.add),
          label: Text('Update'),
        ),
      ]),
    );
  }

  Padding Discription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
          controller: Discription_controller,
          
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

  Future<void> Updateall() async {
    final ed = selecteditems.toString();
    final ed1 = DateTime.now();
    final ed2 = double.parse(Amount_controller.text );
    final ed3 = Discription_controller.text.trim();

    if (ed.isEmpty || ed2 == null || ed3.isEmpty) {
      return;
    } else {
      final updation =
          add_data(select: ed, dateTime: ed1, amount: ed2, description: ed3);
      editdata(widget.index, updation);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Bottom()));
    }
  }
}
