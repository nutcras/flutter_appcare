import 'package:flutter/material.dart';
import 'package:flutter_appcare/views/Register.dart';
import 'package:flutter_appcare/views/backup.dart';
import 'package:flutter_appcare/views/booking/booking.dart';
import 'package:flutter_appcare/views/inputmentor.dart';
import 'package:flutter_appcare/views/Map.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/PageOne': (context) => const PageOne(),
  '/Page1': (context) => const InputMentor(),
  '/Map': (context) => GoogleMaps(),
  '/book': (context) => const Booking(),
  '/Backup': (context) => const BackUp(),
};
