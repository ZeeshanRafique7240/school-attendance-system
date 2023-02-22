import 'package:flutter/material.dart';

class Check_Attendance extends StatefulWidget {
  const Check_Attendance({Key? key}) : super(key: key);

  @override
  State<Check_Attendance> createState() => _Check_AttendanceState();
}

class _Check_AttendanceState extends State<Check_Attendance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Attendance"),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.green,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Hello Student"),
        ),
      ),
    );
  }
}
