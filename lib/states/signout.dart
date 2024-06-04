import 'package:flutter/material.dart';
import 'package:pkofficer/states/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<Null> signoutProcess(BuildContext context) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.clear();
  // exit(0);
  MaterialPageRoute route = MaterialPageRoute(
    builder: (context) => const Login(),
  );
  Navigator.pushAndRemoveUntil(context, route, (route) => false);
}
