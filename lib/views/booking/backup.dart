import 'package:flutter/material.dart';
import '../../models/sidemenu.dart';
import 'cancleBook.dart';
import 'finishBook.dart';

class BackUp extends StatelessWidget {
  const BackUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ประวัติย้อนหลัง'),
        backgroundColor: const Color.fromARGB(255, 45, 134, 156),
      ),
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: (() {
                  Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const FinishBooking()));
                }),
                child: Text('ดูประวัติที่สำเร็จ'),
                style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 39, 110, 168),
                    primary: Colors.white),
              ),
              const SizedBox(width: 20),
              TextButton(
                onPressed: (() {
                  Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const CancleBooking()));
                }),
                child: const Text(
                  'ดูประวัติที่ยกเลิก',
                ),
                style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 39, 110, 168),
                    primary: Colors.white),
              ),
            ],
          ),
        ),
      ]),
      drawer: SideMenu(),
    );
  }
}
