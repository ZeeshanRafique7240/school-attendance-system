// ignore_for_file: prefer_const_constructors

import 'package:attendacesystemapp/auth/adminLogin.dart';

import 'package:attendacesystemapp/auth/studentlogin.dart';
import 'package:flutter/material.dart';

class Onboard extends StatefulWidget {
  const Onboard({Key? key}) : super(key: key);

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF01579B),
          // image: DecorationImage(
          //   image: AssetImage("assets/onboard.webp"),
          //   fit: BoxFit.fill,
          // ),
        ),
        padding: const EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            const SizedBox(
              height: 150,
            ),
            const Text(
              "Welcome",
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StudentLogin()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      // height: 30,
                      // width: 30,
                      decoration: const BoxDecoration(color: Colors.green),
                      child: Column(
                        children: const [
                          CircleAvatar(
                              backgroundColor: Color(0xFFAED581),
                              radius: 40,
                              child: Icon(
                                Icons.lock_open_outlined,
                                color: Colors.white,
                              )),
                          Text("student")
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AdminLogin()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      // height: 30,
                      // width: 30,
                      decoration: BoxDecoration(color: Color(0xFFAED581)),
                      child: Column(
                        children: const [
                          CircleAvatar(
                              backgroundColor: Colors.green,
                              radius: 40,
                              child: Icon(
                                Icons.shop_2_outlined,
                                color: Colors.white,
                              )),
                          Text("admin")
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
