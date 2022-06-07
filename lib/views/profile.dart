import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_appcare/models/profilemenu.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'outmain/login.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key, required this.data}) : super(key: key);
  final dynamic data;
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ข้อมูลส่วนตัว'),
        backgroundColor: const Color.fromARGB(255, 45, 134, 156),
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                // backgroundImage: AssetImage(''),
                backgroundColor: const Color.fromARGB(255, 45, 134, 156),
              ),
            ],
          ),
          SizedBox(height: 20),
          ProfileMenu(
              text:
                  '${widget.data['title']} ${widget.data['fname']}  ${widget.data['lname']}',
              press: () {
                // senddata('${widget.data['idc']}', '${widget.data['title']}',
                //'${widget.data['fname']}', '${widget.data['lname']}'); อันนี้คือส่งข้อมูลอันเดียว
              }),
          ProfileMenu(
            text: '${widget.data['birtday']}',
            press: () {},
          ),
          ProfileMenu(
            text: '${widget.data['phone']}',
            press: () {},
          ),
          ProfileMenu(
            text: '${widget.data['address']}',
            press: () {},
          ),
          SizedBox(height: 20),
          TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.fromLTRB(100, 15, 100, 15),
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
