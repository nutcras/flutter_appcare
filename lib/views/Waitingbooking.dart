import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_appcare/views/book_detail.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/sidemenu.dart';

class WaitingBooking extends StatefulWidget {
  const WaitingBooking({Key? key}) : super(key: key);

  @override
  State<WaitingBooking> createState() => _WaitingBookingState();
}

class _WaitingBookingState extends State<WaitingBooking> {
  dynamic data;

  @override
  void initState() {
    super.initState();
    startApi();
  }

  startApi() async {
    final prefs =
        await SharedPreferences.getInstance(); //เพิ่มตัวแชร์จากหน้าlogin
    int? idUser = prefs.getInt('idm');
    dynamic item = await getdata(idUser); //ส่งค่าไปยัง getdataหรือตัวรับapi
    setState(() {
      data = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('รอการยืนยัน'),
        backgroundColor: const Color.fromARGB(255, 45, 134, 156),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: RefreshIndicator(
          onRefresh: () async {
            startApi();
          },
          child: ListView.builder(
            itemCount:
                data?.length ?? 0, //เอาออกไปก่อนเพราะตัวdata.lengthยังพังอยู่
            // itemCount: 3, //ใช้ตัวนี้แทนเพราะตัวdataพัง
            itemBuilder: (context, i) => InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            Bookdetail(data: data[i])));
              },
              child: Card(
                elevation: 10,
                color: Color.fromARGB(255, 190, 215, 222),
                shadowColor: const Color.fromARGB(255, 10, 91, 111),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            const SizedBox(
                              width: 15,
                            ),
                            const SizedBox(
                              width: 55.0,
                              height: 55.0,
                              child: CircleAvatar(),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Container(
                              padding: const EdgeInsets.all(22),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${data[i]['title']} ${data[i]['fname']} ${data[i]['lname']}',
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                  Text(
                                    'เริ่ม : ' +
                                        DateFormat('dd-mm-yy KK:MM').format(
                                            DateTime.parse(
                                                '${data[i]['start_time']}')),
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    'ถึง :  ' +
                                        DateFormat('dd-mm-yy KK:MM').format(
                                            DateTime.parse(
                                                '${data[i]['end_time']}')),
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ])
                    ]),
              ),
            ),
          ),
        ),
      ),
      //หน้าปุ่มsidemenu
    );
  }
}

Future<dynamic> getdata(dynamic idUser) async {
  Uri url = Uri.parse(
      'http://206.189.92.71:3200/api/booking/cust/72/$idUser'); //รับค่ามาจากiduser หรือตัวที่แชร์มาจากหน้าlogin ส่งไปยังurlเพื่อเช็คว่าคนนี้มีนัดหมายใครบ้าง รับค่ามาจากiduser หรือตัวที่แชร์มาจากหน้าlogin ส่งไปยังurlเพื่อเช็คว่าคนนี้มีนัดหมายใครบ้าง
  return await http
      .get(
    url,
  )
      .then((req) async {
    if (req.statusCode == 200) {
      var data = jsonDecode(req.body);
      return data;
    } else {
      return null;
    }
  });
}
