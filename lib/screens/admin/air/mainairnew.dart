import 'package:flutter/material.dart';
import 'package:pkofficer/screens/admin/air/mainairhome.dart';
import 'package:pkofficer/screens/admin/cctv/mainhome.dart';
import 'package:pkofficer/screens/admin/cctv/mainreport.dart';
import 'package:pkofficer/screens/admin/fire/mainfirereq.dart';
import 'package:pkofficer/screens/admin/profiles/mainprofile.dart';
import 'package:pkofficer/states/nortify.dart';
import 'package:pkofficer/utility/my_constant.dart';
import 'package:pkofficer/widgets/home_app_bar.dart';

class MainAirNew extends StatefulWidget {
  const MainAirNew({super.key});

  @override
  State<MainAirNew> createState() => _MainAirNewState();
}

class _MainAirNewState extends State<MainAirNew> {
  int currentIndex = 2;
  List screens = const [
    // MainCctvAdd(),
    Scaffold(), // 0
    Scaffold(), // 1
    MainAirHome(), // 2
    Scaffold(), // 3
    Scaffold(), // 4
    Scaffold() // 5
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 224, 248, 246),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            currentIndex = 2;
          });
        },
        shape: const CircleBorder(),
        backgroundColor: Color.fromARGB(255, 9, 197, 181),
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
        color: Color.fromARGB(255, 211, 245, 242),
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
                Icons.person,
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
