import 'package:flutter/material.dart';
import 'package:tese_journey/Pages/plan_note.dart';
import 'package:tese_journey/components/image_slider.dart';
import 'package:tese_journey/gallary.dart';
import 'package:tese_journey/image_pick.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ImagePickerScreen(),
    );
  }
}
