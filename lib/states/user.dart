import 'package:flutter/material.dart';
import 'package:pkofficer/pages/cctv.dart';
import 'package:pkofficer/pages/home.dart';
import 'package:pkofficer/pages/profile.dart';
import 'package:pkofficer/screens/admin/fdh/mainpidsit.dart';
import 'package:pkofficer/screens/admin/fdh/mainpullpidsit.dart';
import 'package:pkofficer/screens/user/maindbuser.dart';
import 'package:pkofficer/screens/user/mainpramuan.dart';
import 'package:pkofficer/screens/user/mainuserprofile.dart';
import 'package:pkofficer/utility/my_constant.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  int currentIndex = 2;
  List screens = const [
    // MainAuthpidsit(),
    MainPramuan(), // 0
    MainPidsit(), // 1
    // MainFdh(),        // 2
    MainDbUser(), // 2
    MainPullPidsit(), // 3
    MainUserProfilr(), // 4
    // Scaffold()         // 5
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 221, 239, 253),
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
        color: Color.fromARGB(255, 246, 250, 253),
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
    );
  }

  Widget getSelectedWidget({required int index}) {
    Widget widget;
    switch (index) {
      case 0:
        widget = const HomePage();
        break;
      case 1:
        widget = const CctvPage();
        break;
      case 2:
        widget = const Profile();
        break;
      default:
        widget = const HomePage();
    }
    return widget;
  }
}
