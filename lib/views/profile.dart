import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_appcare/views/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profiles extends StatefulWidget {
  const Profiles({Key? key, required this.data}) : super(key: key);
  final dynamic data;
  @override
  State<Profiles> createState() => _ProfilesState();
}

class _ProfilesState extends State<Profiles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ข้อมูลส่วนตัว'),
        backgroundColor: const Color.fromARGB(255, 45, 134, 156),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/images/profile.jpg'),
              backgroundColor: Color.fromARGB(255, 45, 134, 156),
            ),
          ),
          const SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Column(
              children: [
                Container(
                  color: const Color.fromARGB(255, 150, 217, 234),
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        '${widget.data['title']} ${widget.data['fname']} ${widget.data['lname']}',
                        // '${data['title']} ${data['fname']} ${data['lname']}',
                        //สำหรับใส่ข้อมูลจากdatabase
                        style: const TextStyle(fontSize: 24),
                      ),
                      Text(
                        'อายุ : 22    เพศ : ${widget.data['title']}',
                        //ใส่อายุ
                        style: const TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: const Color.fromARGB(255, 150, 217, 234),
                  padding: const EdgeInsets.all(8.0),
                  child: const Text(
                    'โรคเบาหวาน',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: const Color.fromARGB(255, 150, 217, 234),
                  padding: const EdgeInsets.all(8.0),
                  child: const Text(
                    'โรคหัวใจ',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: const [
              SizedBox(width: 80),
              Text('ลักษณะผู้ป่วย', style: TextStyle(fontSize: 20)),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const SizedBox(width: 80),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: const Color.fromARGB(255, 150, 217, 234),
                  padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                  child: const Text(
                    'ผู้ป่วยติดเตียง',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              const SizedBox(width: 80),
              const Icon(Icons.phone),
              const SizedBox(width: 10),
              Text('${widget.data['phone']}',
                  style: const TextStyle(fontSize: 17)),
              const SizedBox(width: 105),
              TextButton(
                  onPressed: () {
                    senddata('${widget.data['idc']}');
                  },
                  child: const Text('แก้ไข',
                      style: TextStyle(fontSize: 17, color: Colors.red)))
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 80),
              const Icon(Icons.phone),
              const SizedBox(width: 10),
              Text('''${widget.data['address']}''',
                  style: const TextStyle(fontSize: 17)),
              const SizedBox(width: 17),
              TextButton(
                  onPressed: () {
                    senddata('${widget.data['idc']}');
                  },
                  child: const Text('แก้ไข',
                      style: TextStyle(fontSize: 17, color: Colors.red)))
            ],
          ),
          const SizedBox(height: 10),
          TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.fromLTRB(120, 20, 120, 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              backgroundColor: const Color.fromARGB(255, 232, 92, 22),
              primary: const Color.fromARGB(255, 255, 255, 255),
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.remove('token');
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyHomePage(),
                    //แก้ตรงนี้--------------------------------------------------------------------------------------
                  ),
                  (route) => false);
            },
            child: const Text('ออกจากระบบ'),
          ),
        ],
      ),
    );
  }
}

Future senddata(dynamic idUser) async {
  Uri url = Uri.parse('http://206.189.02.71:3200/api/customer/$idUser');
  return await http.post(url).then((req) async {
    if (req.statusCode == 200) {
      var data = jsonDecode(req.body);
      return data;
    } else {
      return null;
    }
  });
}
