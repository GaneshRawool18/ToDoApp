import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/to_do_list.dart';

class FirebaseServices {
  static firebaseAddData(String userName, String userEmail, String password) {
    Map<String, dynamic> data = {
      "userName": userName,
      "userEmail": userEmail,
      "password": password,
    };
    FirebaseFirestore ref = FirebaseFirestore.instance;
    DocumentReference docRef = ref.collection('UsersData').doc(userName);
    docRef.set(data);
  }

  static void firebaseGetData(String userName, String password, context) async {
    DocumentSnapshot getData = await FirebaseFirestore.instance
        .collection('UsersData')
        .doc(userName)
        .get();

    dynamic mapData = getData.data()!;

    if (userName.trim().isNotEmpty &&
        password.trim().isNotEmpty &&
        userName == mapData['userName'] &&
        password == mapData['password']) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return const ToDoList();
      }));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Please enter all details or Invalid credentials  "),
        backgroundColor: Color.fromARGB(255, 216, 9, 16),
      ));
    }
    log("map data $mapData");
  }
}
