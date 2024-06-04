import 'package:flutter/material.dart';

class MainPramuan extends StatefulWidget {
  const MainPramuan({super.key});

  @override
  State<MainPramuan> createState() => _MainPramuanState();
}

class _MainPramuanState extends State<MainPramuan> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(backgroundColor: Color.fromARGB(255, 216, 250, 249),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Padding(
          padding: EdgeInsets.only(right: 5),
          child: Center(
            child: Text(
              'แบบประเมิน',
              // _gleaveModel.LEAVE_PERSON_FULLNAME,
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'Kanit-Regular',
                color: Color.fromARGB(255, 4, 197, 193),
              ),
            ),
          ),
        ),
      ),
      
    );
  } 
}