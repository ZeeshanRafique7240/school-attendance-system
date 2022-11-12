// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Student_Drawer extends StatefulWidget {
  const Student_Drawer({Key? key}) : super(key: key);

  @override
  State<Student_Drawer> createState() => _Student_DrawerState();
}

class _Student_DrawerState extends State<Student_Drawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        color: Colors.grey,
        child: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text("Zeeshan Rafique"),
                accountEmail: Text("zeeshan321@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  child: Text("p"),
                ),
              ),
              Divider(
                height: 2,
                color: Colors.black,
              ),

              ListTile(
                trailing: Icon(Icons.home),
                title: Text("Home"),
                onTap: () {},
                tileColor: Colors.amber,
              ),

              ListTile(
                trailing: Icon(
                  Icons.camera_alt,
                ),
                title: Text("Camera"),
                onTap: () {},
              ),

              //3
              ListTile(
                trailing: Icon(Icons.trending_down),
                title: Text("Trending"),
                onTap: () {},
              ),

              ListTile(
                trailing: Icon(Icons.share),
                title: Text(
                  "Share",
                  style: TextStyle(color: Colors.red),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
