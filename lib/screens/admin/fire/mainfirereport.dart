import 'package:flutter/material.dart';
import 'package:pkofficer/utility/my_constant.dart';

class MainFirereport extends StatefulWidget {
  const MainFirereport({super.key});

  @override
  State<MainFirereport> createState() => _MainFirereportState();
}

class _MainFirereportState extends State<MainFirereport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[500],
      appBar: AppBar(
        elevation: 0,
        title: const Text('Fire Report'),
        centerTitle: false,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: IconButton(
              style: IconButton.styleFrom(
                  backgroundColor: MyConstant.kprimaryColor,
                  padding: const EdgeInsets.all(15)),
              onPressed: () {},
              iconSize: 25,
              color: Colors.lightBlue,
              icon: const Icon(Icons.notifications),
            ),
          ),
        ],
      ), 
    );
  }
}