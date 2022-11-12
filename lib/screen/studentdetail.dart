// ignore_for_file: prefer_const_constructors

import 'package:attendacesystemapp/auth/studentlogin.dart';
import 'package:attendacesystemapp/screen/studentdrawer.dart';
import 'package:attendacesystemapp/screen/uploadimage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Student_Detail extends StatefulWidget {
  @override
  State<Student_Detail> createState() => _Student_DetailState();
}

class _Student_DetailState extends State<Student_Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mark Attendance"),
      ),
      body: MyStatefulWidget(),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Attendance System"),
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
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => Student_Detail())));
              },
              tileColor: Colors.amber,
            ),

            ListTile(
              trailing: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => StudentLogin())));
              },
            ),

            //3
          ],
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController departmentControler = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  Object? _itemValue;

  int? _radioValue = 0;

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Form(
        key: formkey,
        child: ListView(
          children: <Widget>[
            //     )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Required";
                  } else {
                    return null;
                  }
                },
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Your Name',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextFormField(
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Required";
                  } else {
                    return null;
                  }
                },
                controller: addressController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Class Name',
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    )),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextFormField(
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Required";
                  } else {
                    return null;
                  }
                },
                controller: departmentControler,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Department',
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    )),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextFormField(
                validator: (val) {
                  if (val!.length < 11) {
                    return "complete number";
                  } else {
                    return null;
                  }
                },
                controller: numberController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Phone number',
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    )),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 180,
              width: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blueGrey,
              ),
              child: Center(
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MyPage()));
                      },
                      icon: Icon(Icons.add))),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                child: const Text('Submit'),
                onPressed: () async {
                  SharedPreferences prefs = await _prefs;
                  if (formkey.currentState!.validate()) {
                    await FirebaseFirestore.instance
                        .collection("student")
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .set({
                      "name": nameController.text.trim(),
                      "number": numberController.text.trim(),
                      "address": addressController.text.trim(),
                      "department": departmentControler.text.trim(),
                      "status": "waiting",
                    });
                    prefs.setString("name", nameController.text);

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.redAccent,
                        content: Text(
                          "Your Attendance uploaded Sucessfuly",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
