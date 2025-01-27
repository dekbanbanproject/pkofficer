import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:pkofficer/widgets/home_app_bar.dart';
import 'package:pkofficer/widgets/search_bar.dart';

class VisitPatientPage extends StatefulWidget {
  const VisitPatientPage({super.key});

  @override
  State<VisitPatientPage> createState() => _VisitPatientPageState();
}

class _VisitPatientPageState extends State<VisitPatientPage> {
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 216, 250, 249),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Padding(
          padding: EdgeInsets.only(right: 5),
          child: Center(
            child: Text(
              'Visit Patient',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            SizedBox(height: 15),
            CustomAppBar(),
             SizedBox(height: 15),
              MySearchBar(),
          ],),
        ),
      ),
    );
  }
}
