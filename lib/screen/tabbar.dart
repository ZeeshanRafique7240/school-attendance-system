import 'package:attendacesystemapp/screen/Check_attendance.dart';
import 'package:attendacesystemapp/screen/student_info.dart';
import 'package:flutter/material.dart';

class Tab_bar extends StatefulWidget {
  const Tab_bar({Key? key}) : super(key: key);

  @override
  State<Tab_bar> createState() => _Tab_barState();
}

class _Tab_barState extends State<Tab_bar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(tabs: [
          Tab(
            icon: Icon(Icons.home),
          ),
          Tab(
            icon: Icon(Icons.record_voice_over_outlined),
          )
        ]),
      ),
      body: TabBarView(children: [HomeScreen(), Check_Attendance()]),
    );
  }
}
