import 'package:flutter/material.dart';
import 'package:pkofficer/screens/admin/fdh/mainpullpidsit.dart';
import 'package:pkofficer/screens/admin/fire/mainfirereport.dart';
import 'package:pkofficer/screens/admin/fire/mainfirereq.dart';
import 'package:pkofficer/screens/admin/fire/mainfireshow.dart';
import 'package:pkofficer/utility/my_constant.dart';

class MainFire extends StatefulWidget {
  const MainFire({super.key});

  @override
  State<MainFire> createState() => _MainFireState();
}

class _MainFireState extends State<MainFire> {
  int currentIndex = 2;
  List screens = const [
    Mainfirereq(), // 0
    Scaffold(), // 1
    MainFireshow(), // 2
    MainFirereport(), // 3
    MainPullPidsit(), // 4
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: screens[currentIndex],
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
                Icons.person,
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
                Icons.file_download,
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
                Icons.select_all,
                size: 30,
                color: currentIndex == 4
                    ? MyConstant.cctvprofileColor
                    : Colors.grey.shade400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
