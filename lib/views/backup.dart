import 'package:flutter/material.dart';
import 'package:flutter_appcare/models/sidemenu.dart';
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
      body: Container(
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
            ),
            SizedBox(width: 20),
            TextButton(
              onPressed: (() {
                Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            const CancleBooking()));
              }),
              child: Text('ดูประวัติที่ยกเลิก'),
            ),
          ],
        ),
      ),
      drawer: SideMenu(),
    );
  }
}
