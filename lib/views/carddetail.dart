// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appcare/models/DatePicker.dart';
import 'package:flutter_appcare/views/SelectBook.dart';

import 'package:provider/provider.dart';

class Carddetail extends StatefulWidget {
  const Carddetail({Key? key, required this.data}) : super(key: key);

  final dynamic data;
  @override
  State<Carddetail> createState() => _CarddetailState();
}

class _CarddetailState extends State<Carddetail> {
  get taskNotifier => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ข้อมูลพนักงงาน'),
        backgroundColor: Color.fromARGB(255, 45, 134, 156),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Center(
              //รูปavatar
              child: CircleAvatar(
                radius: 70,
                backgroundColor: Color.fromARGB(255, 45, 134, 156),
                // backgroundImage: ('widget.data['image']'),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                color: Color.fromARGB(255, 150, 217, 234),
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      'ชื่อ ${widget.data['fname']} ${widget.data['lname']}',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text('ราคาต่อชั่วโมง ${widget.data['rate']}',
                        style: TextStyle(fontSize: 18)),
                    Text('${widget.data['type']}',
                        style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
                child: Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                // ignore: prefer_const_constructors
                Icon(
                  Icons.call,
                  color: Colors.blue,
                  size: 30,
                ),
                Text(
                  '   ${widget.data['phone']}',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  width: 120,
                ),
              ],
            )),
            SizedBox(
              height: 20,
            ),
            Row(children: [
              Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Icon(
                    Icons.map,
                    color: Colors.blue,
                  ),
                  Text(
                    '''   ${widget.data['adr1']} ${widget.data['adr2']} 
    ${widget.data['city']}''',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              SizedBox(width: 50),
            ]),
            SizedBox(
              height: 30,
            ),
            TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.fromLTRB(70, 15, 70, 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                backgroundColor: Color.fromARGB(255, 32, 204, 187),
                primary: Color.fromARGB(255, 255, 255, 255),
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) => SelectBooking()));
              },
              child: const Text(
                'นัดเวลา',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DatePickerNotifier extends ChangeNotifier {
  DateTime? _selectedDateTime;
  DateTime? get selectDateTime => _selectedDateTime;
  setDateTime({required DateTime candidateDateTime}) {
    _selectedDateTime = candidateDateTime;
    notifyListeners();
  }
}
