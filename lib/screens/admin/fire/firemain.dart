import 'package:flutter/material.dart';
import 'package:pkofficer/screens/admin/fdh/mainpullpidsit.dart';
import 'package:pkofficer/screens/admin/fire/fireadd.dart';
import 'package:pkofficer/screens/admin/fire/mainfirerepaire.dart';
import 'package:pkofficer/screens/admin/fire/mainfirereport.dart';
import 'package:pkofficer/screens/admin/fire/mainfirereq.dart';
import 'package:pkofficer/screens/admin/fire/mainfireshow.dart';
import 'package:pkofficer/utility/my_constant.dart';

class FireMainPage extends StatefulWidget {
  const FireMainPage({super.key});

  @override
  State<FireMainPage> createState() => _FireMainPageState();
}

class _FireMainPageState extends State<FireMainPage> {
  int currentIndex = 2;
  List screens = const [
    Mainfirereq(), // 0
    MainFirerepaire(), // 1
    MainFireshow(), // 2
    MainFirereport(), // 3
    FireAddPage(), // 4
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
     
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
        height: 100,
         color: Color.fromARGB(255, 189, 228, 252),
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
                // Icons.video_camera_front,
                Icons.fire_extinguisher,
                size: 50,
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
                Icons.edit_square,
                size: 50,
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
                size: 50,
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
                Icons.add_task,
                size: 50,
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
