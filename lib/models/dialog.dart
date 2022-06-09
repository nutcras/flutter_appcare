import 'package:flutter/material.dart';
import 'package:flutter_appcare/configs/api.dart';

TextEditingController controller = TextEditingController();
Future opendialog(String data, context) => showDialog(
    context: context,
    builder: (context) => AlertDialog(
          title: Text('Enter Your Edit'),
          content: Column(
            children: [
              TextField(
                controller: controller,
              )
            ],
          ),
          actions: [
            TextButton(
                onPressed: () {
                  submit(context);
                },
                child: Text('Submit'))
          ],
        ));

void submit(context) {
  sendDataProfile(controller.text,context);
  Navigator.of(context).pop();
}
