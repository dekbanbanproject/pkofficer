import 'package:flutter/material.dart';
import 'package:pkofficer/screens/patient/mainpatient.dart';
import 'package:pkofficer/screens/patient/nadpatient.dart';
import 'package:pkofficer/screens/patient/patientprofile.dart';
import 'package:pkofficer/screens/patient/reportpatient.dart';
import 'package:pkofficer/screens/patient/visitpatient.dart';
import 'package:pkofficer/states/signout.dart';
import 'package:pkofficer/utility/my_constant.dart';

class PatientPage extends StatefulWidget {
  const PatientPage({super.key});

  @override
  State<PatientPage> createState() => _PatientPageState();
}

int currentIndex = 2;

  List screens = const [ 
    MainPatientPage(), // 0
    NadPatientPage(), // 1 
    VisitPatientPage(), // 2
    PatientProfile(), // 3
    ReportPatient(), // 4 
  ];

class _PatientPageState extends State<PatientPage> {   
  @override
  
   Widget build(BuildContext context) {
    return Scaffold(
      // appBar: Text('data'),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            currentIndex = 2;
          });
        },
        shape: const CircleBorder(),
        backgroundColor: MyConstant.cctvaddColor,
        child: const Icon(
          Icons.home,
          color: Colors.white,
          size: 50,
        ),
       
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 5,
        height: 70,
        color: const Color.fromARGB(255, 248, 224, 224),
        shape: const CircularNotchedRectangle(),
        notchMargin: 15,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 0;
                });
              },
              icon: Icon(
                Icons.notifications_outlined,
                size: 30,
                color: currentIndex == 0
                    ? MyConstant.cctvhomeColor
                    : Colors.grey.shade400,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 1;
                });
              },
              icon: Icon(
                Icons.manage_accounts,
                size: 30,
                color: currentIndex == 1
                    ? MyConstant.kcctvtColor
                    : Colors.grey.shade400,
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 3;
                });
              },
              icon: Icon(
                Icons.bar_chart,
                size: 30,
                color: currentIndex == 3
                    ? MyConstant.cctvtreportColor
                    : Colors.grey.shade400,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 4;
                });
              },
              icon: Icon(
                Icons.lock_person,
                size: 30,
                color: currentIndex == 4
                    ? MyConstant.cctvprofileColor
                    : Colors.grey.shade400,
              ),
            ),
          ],
        ),
      ),
      body: screens[currentIndex],
    );
  }
}