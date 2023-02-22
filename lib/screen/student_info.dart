import 'dart:async';
import 'dart:io';

import 'package:attendacesystemapp/auth/studentlogin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController classController = TextEditingController();
  TextEditingController rollController = TextEditingController();
  TextEditingController sectionController = TextEditingController();
  String date = DateTime.now().toString();
  bool ischeck = false;

  File? profilrpick;
  int counter = 20;

  void _startcounter() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        counter = 0;
        if (counter < 20) {
          setState(() {
            counter++;
          });
        } else if (counter == 20) {
          saveUser();
        }
      });
    });
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushReplacement(
        context, CupertinoPageRoute(builder: (context) => StudentLogin()));
  }

  void saveUser() async {
    String name = nameController.text.trim();
    String classname = classController.text.trim();
    String rollno = rollController.text.trim();
    String section = sectionController.text.trim();

    nameController.clear();
    classController.clear();
    rollController.clear();
    sectionController.clear();

    if (name != "" &&
        date != null &&
        classname != "" &&
        rollno != "" &&
        section != null &&
        profilrpick != "") {
      UploadTask uploadTask = FirebaseStorage.instance
          .ref()
          .child("profilepick")
          .child(Uuid().v1())
          .putFile(profilrpick!);
      TaskSnapshot taskSnapshot = await uploadTask;
      String downloadurl = await taskSnapshot.ref.getDownloadURL();
      await FirebaseFirestore.instance.collection("student").add({
        "name": name,
        "class": classname,
        "Rollno": rollno,
        "profilepick": downloadurl,
        "date": date,
      });
    } else {
      print("please fill all the filed ");
    }
    setState(() {
      profilrpick = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              logout();
            },
            icon: Icon(Icons.exit_to_app),
          ),
        ],
        title: Text("Home_Screen"),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                CupertinoButton(
                  onPressed: () async {
                    XFile? selectedimage = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    if (selectedimage != null) {
                      File convertedfile = File(selectedimage.path);
                      setState(() {
                        profilrpick = convertedfile;
                      });
                    } else {
                      print("no image selected");
                    }
                  },
                  padding: EdgeInsets.zero,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.blue,
                    backgroundImage:
                        (profilrpick != null) ? FileImage(profilrpick!) : null,
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                      labelStyle: TextStyle(fontSize: 20),
                      hintText: "Name"),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: classController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.class_),
                      labelStyle: TextStyle(fontSize: 20),
                      hintText: "class"),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: rollController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.numbers),
                      labelStyle: TextStyle(fontSize: 20),
                      hintText: "Roll No"),
                ),
                SizedBox(
                  height: 10,
                ),
                //section
                TextField(
                  controller: sectionController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.security_outlined),
                      labelStyle: TextStyle(fontSize: 20),
                      hintText: "Section"),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      _startcounter();
                    },
                    child: Text("Submit")),
                SizedBox(
                  height: 20,
                ),
                Text("$counter"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
