import 'package:flutter/material.dart';
import 'package:flutter_appcare/configs/api.dart';

TextEditingController controller1 = TextEditingController();
TextEditingController controller2 = TextEditingController();
TextEditingController controller3 = TextEditingController();
Future openDialog(String title,String name, String surname, context) => showDialog(
    context: context,
    builder: (context) => Container(
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
      child: AlertDialog(
            title: const Text('Enter Your Edit'),
            content: Column(
              children: [
              TextField(controller: controller1,decoration: InputDecoration(hintText: title),),
                TextField(controller: controller2,decoration: InputDecoration(hintText: name),),
                TextField(controller: controller3,decoration: InputDecoration(hintText: surname),),
              ],

            ),
            actions: [
              TextButton(
                  onPressed: () {
                    submit(context);
                  },
                  child: const Text('Submit'))
            ],
          ),
    ));

void submit(context) {
  sendDataProfile(controller1.text, controller2.text, controller3.text, context);
  Navigator.of(context).pop();
}
