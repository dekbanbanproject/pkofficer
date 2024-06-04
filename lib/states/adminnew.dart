import 'package:flutter/material.dart';
import 'package:pkofficer/screens/admin/cctv/maincctvreq.dart';

import 'package:pkofficer/screens/admin/cctv/mainhome.dart';
import 'package:pkofficer/screens/admin/profiles/mainprofile.dart';
import 'package:pkofficer/screens/admin/cctv/mainreport.dart';
import 'package:pkofficer/screens/admin/fire/mainfirereq.dart';
import 'package:pkofficer/utility/my_constant.dart';

class AdminNew extends StatefulWidget {
  const AdminNew({super.key});

  @override
  State<AdminNew> createState() => _AdminNewState();
}

int currentIndex = 2;
List screens = const [
  // MainCctvAdd(),
  MaincctvReq(), // 0
  Mainfirereq(), // 1
  MainHome(), // 2
  MainReport(), // 3
  MainProfile(), // 4
  Scaffold() // 5
];

class _AdminNewState extends State<AdminNew> {
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
          size: 35,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        height: 70,
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
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
                Icons.bookmark_add,
                size: 30,
                color: currentIndex == 1
                    ? MyConstant.kcctvtColor
                    : Colors.grey.shade400,
              ),
            ),
            const SizedBox(
              width: 15,
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
                Icons.person,
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
