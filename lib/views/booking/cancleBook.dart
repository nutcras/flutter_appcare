import 'package:flutter/material.dart';
import '../../configs/api.dart';
import 'book_detail2.dart';
import 'package:intl/intl.dart';

class CancleBooking extends StatefulWidget {
  const CancleBooking({Key? key}) : super(key: key);

  @override
  State<CancleBooking> createState() => _CancleBookingState();
}

class _CancleBookingState extends State<CancleBooking> {
  dynamic data;

  @override
  void initState() {
    super.initState();
    startApi();
  }

  startApi() async {
    dynamic item = await getdata(74); //ส่งค่าไปยัง getdataหรือตัวรับapi
    setState(() {
      data = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('การนัดหมายที่ยกเลิก'),
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
                            Bookdetail2(data: data[i])));
              },
              child: Card(
                elevation: 10,
                color: Color.fromARGB(255, 186, 198, 201),
                shadowColor: Color.fromARGB(255, 99, 108, 110),
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
                                        DateFormat('dd-mm-yy HH:mm').format(
                                            DateTime.parse(
                                                '${data[i]['start_time']}')),
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    'ถึง :  ' +
                                        DateFormat('dd-mm-yy HH:mm').format(
                                            DateTime.parse(
                                                '${data[i]['end_time']}')),
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  // Text(
                                ],
                              ),
                            ),
                          ])
                    ]),
              ),
            ),
          ),
        ),
      ), //หน้าปุ่มsidemenu
    );
  }
}
