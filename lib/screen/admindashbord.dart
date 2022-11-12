import 'package:attendacesystemapp/auth/adminLogin.dart';
import 'package:attendacesystemapp/screen/see_student.dart';
import 'package:flutter/material.dart';

class Admin_Dashbord extends StatefulWidget {
  const Admin_Dashbord({Key? key}) : super(key: key);

  @override
  State<Admin_Dashbord> createState() => _Admin_DashbordState();
}

class _Admin_DashbordState extends State<Admin_Dashbord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin_Dashbord"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.grey),
        child: Column(
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Student Attendance Record",
                  style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GetUserName("1")));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Text(
                      "Present",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: (() {}),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: const Text(
                      "Upsent",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
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
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => Admin_Dashbord())));
              },
              tileColor: Colors.amber,
            ),
            ListTile(
              trailing: Icon(
                Icons.logout,
              ),
              title: Text("Logout"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => AdminLogin())));
              },
            ),
          ],
        ),
      ),
    );
  }
}
