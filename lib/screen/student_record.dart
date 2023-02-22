import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class Student_Record extends StatefulWidget {
  const Student_Record({Key? key}) : super(key: key);

  @override
  State<Student_Record> createState() => _Student_RecordState();
}

class _Student_RecordState extends State<Student_Record>
    with SingleTickerProviderStateMixin {
  bool ischeck = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Dashbord"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection("student").snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData && snapshot.data != null) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> userMap =
                            snapshot.data!.docs[index].data()
                                as Map<String, dynamic>;
                        // return SingleChildScrollView(
                        //   child: Column(
                        //     children: [
                        //       Image.network(
                        //         userMap["profilepick"],
                        //         height: 100,
                        //         width: 200,
                        //         // fit: BoxFit.fill,
                        //       ),
                        //       Text(userMap["name"]),
                        //       Text(userMap["Rollno"]),
                        //       Text(userMap["class"]),
                        //     ],
                        //   ),
                        // );

                        return ListTile(
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                NetworkImage(userMap["profilepick"]),
                          ),
                          title: Text(userMap["name"]),
                          subtitle: Text(userMap["class"]),
                          trailing: Checkbox(
                              value: ischeck,
                              onChanged: (bool? value) {
                                setState(() {
                                  ischeck = value!;
                                });
                              }),
                        );
                      },
                    ),
                  );
                } else {
                  return Text("No data!");
                }
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          ElevatedButton(onPressed: () {}, child: Text("Save Attendace"))
        ],
      ),
    );
  }
}
