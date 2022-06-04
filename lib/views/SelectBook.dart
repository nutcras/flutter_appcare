// ignore: file_names
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_appcare/configs/config.dart';
import 'package:flutter_appcare/views/Waitingbooking.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SelectBooking extends StatefulWidget {
  const SelectBooking({Key? key}) : super(key: key);
  @override
  State<SelectBooking> createState() => _SelectBookingState();
}

class _SelectBookingState extends State<SelectBooking> {
  TextEditingController picdate = TextEditingController();
  TextEditingController pictime = TextEditingController();
  TextEditingController picdate2 = TextEditingController();
  TextEditingController pictime2 = TextEditingController();

  DateTime? datenow = DateTime.now();

  @override
  Widget build(BuildContext context) {
    void newDate() async {
      DateTime? date = await showDatePicker(
          context: context,
          initialDate: datenow!,
          firstDate: DateTime(DateTime.now().year, DateTime.now().month, 1),
          lastDate: DateTime(DateTime.now().year, DateTime.now().month, 30));
      if (date != null) {
        setState(() {
          datenow = date;
          picdate.text = DateFormat("yyyy-MM-dd").format(date);
          DateFormat("yyyy-MM-dd").format(date);
        });
      }
    }

    void newTime() async {
      TimeOfDay? time =
          await showTimePicker(context: context, initialTime: TimeOfDay.now());
      if (time != null) {
        setState(() {
          // datenow = date;
          pictime.text = '${time.hour}:${time.minute}';
          // DateFormat("dd/MM/yyyy").format(date);
        });
      }
    }

    void newDate2() async {
      DateTime? date = await showDatePicker(
          context: context,
          initialDate: datenow!,
          firstDate: DateTime(DateTime.now().year, DateTime.now().month, 1),
          lastDate: DateTime(DateTime.now().year, DateTime.now().month, 30));
      if (date != null) {
        setState(() {
          datenow = date;
          picdate2.text = DateFormat("yyyy-MM-dd").format(date);
          DateFormat("yyyy-MM-dd").format(date);
        });
      }
    }

    void newTime2() async {
      TimeOfDay? time =
          await showTimePicker(context: context, initialTime: TimeOfDay.now());
      if (time != null) {
        setState(() {
          // datenow = date;
          pictime2.text = '${time.hour}:${time.minute}';
          // DateFormat("dd/MM/yyyy").format(date);
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('SelectBooking'),
        backgroundColor: const Color.fromARGB(255, 45, 134, 156),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: picdate,
                  readOnly: true,
                  onTap: () {
                    newDate();
                  },
                  decoration: const InputDecoration(
                    labelText: 'วันที่',
                    labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    hintStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 0, 0, 0), width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 23, 142, 239),
                            width: 1.5),
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: pictime,
                  readOnly: true,
                  onTap: () {
                    newTime();
                  },
                  decoration: const InputDecoration(
                    labelText: 'เวลา',
                    labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    hintStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 0, 0, 0), width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 23, 142, 239),
                            width: 1.5),
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: picdate2,
                  readOnly: true,
                  onTap: () {
                    newDate2();
                  },
                  decoration: const InputDecoration(
                    labelText: 'วันที่',
                    labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    hintStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 0, 0, 0), width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 23, 142, 239),
                            width: 1.5),
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: pictime2,
                  readOnly: true,
                  onTap: () {
                    newTime2();
                  },
                  decoration: const InputDecoration(
                    labelText: 'เวลา',
                    labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    hintStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 0, 0, 0), width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 23, 142, 239),
                            width: 1.5),
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                  ),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: (() {
                    sendtimebook(pictime.text, picdate.text, pictime2.text,
                        picdate2.text, context);
                  }),
                  child: Text('ยืนยันการจอง'),
                )
              ],
            )),
      ),
    );
  }
}

Future sendtimebook(pictime, picdate, pictime2, picdate2, context) async {
  final prefs =
      await SharedPreferences.getInstance(); //เพิ่มตัวแชร์จากหน้าlogin
  int? idUser = prefs.getInt('idm');
  Uri url = Uri.parse('http://206.189.92.71:3200/api/booking');
  http
      .post(
    url,
    headers: headers,
    body: jsonEncode({
      "start_time": picdate,
      "end_time": picdate2,
      "cust_id": idUser,
      "bstatus": 71,
    }),
  )
      .then((req) async {
    if (req.statusCode == 201) {
      EasyLoading.showSuccess('Great Success!');
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const WaitingBooking()),
          (Route<dynamic> route) => false);
    } else {
      print('error');
      EasyLoading.showError('Failed with Error');
    }
  });
}
