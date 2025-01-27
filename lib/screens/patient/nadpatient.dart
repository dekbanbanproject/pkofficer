import 'package:flutter/material.dart';

class NadPatientPage extends StatefulWidget {
  const NadPatientPage({super.key});

  @override
  State<NadPatientPage> createState() => _NadPatientPageState();
}

class _NadPatientPageState extends State<NadPatientPage> {
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
              'Nad Patient',
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