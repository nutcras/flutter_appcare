import 'package:flutter/material.dart';
import 'package:flutter_appcare/models/sidemenu.dart';

class BackUp extends StatelessWidget {
  const BackUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ประวัติย้อนหลัง'),
        backgroundColor: const Color.fromARGB(255, 45, 134, 156),
      ),
      drawer: SideMenu(),
    );
  }
}
