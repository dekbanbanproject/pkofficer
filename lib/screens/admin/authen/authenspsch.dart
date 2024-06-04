import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pkofficer/screens/admin/authen/authenReport.dart';
import 'package:pkofficer/screens/admin/authen/authenlist.dart';
import 'package:pkofficer/screens/admin/authen/authenpull.dart';
import 'package:pkofficer/screens/admin/fdh/mainpidsit.dart';
import 'package:pkofficer/screens/admin/fdh/mainpidsitreport.dart';
import 'package:pkofficer/utility/my_constant.dart';
import 'package:pkofficer/utility/my_dialog.dart';

class Authenspsch extends StatefulWidget {
  const Authenspsch({super.key});

  @override
  State<Authenspsch> createState() => _AuthenspschState();
}

class _AuthenspschState extends State<Authenspsch> {
  int currentIndex = 2;
  List screens = const [
    AuthenList(), // 0
    MainPidsit(), // 1
    // Scaffold(),
    AuthenPull(), // 2
    // MainFdh(),
    AuthenReport(), // 3
    MainPidsitReport(), // 4
    // Scaffold()         // 5
  ];

  Future<void> Pull_authen() async {
    try {
      String path = MyConstant.authenspsch;
      await Dio().get(path).then((value) async {
        String dd = value.toString();
        print('######## Vaaaaaaaaaa = $dd');
        if (value.toString() == 'true') {
          MyDialog().normalDialog(context, 'Pull Success', 'Success');
          // Navigator.pop(context, MaincctvReq());
        } else {
          MyDialog().normalDialog(context, 'Not Success', 'UnSuccess');
        }
      });
      print('## value for API ===> ');
    } on PlatformException {}
    if (!mounted) return;
  }

  Future<void> Pull_hos() async {
    try {
      final url = MyConstant.pullhos;
      // var url = Uri.parse('${MyConstant.pullhos}');
      // var res = await http.get(url);
      //  print('## value for API ===> $res');
      // var response = jsonDecode(res.body);
      //  final status = response.statusCode;
      // var response= await json.decode(json.encode(res.body));
      await Dio().get(url).then((values) async {
        String ddd = values.toString();
        // final status = response.statusCode;
        // final isValid = status != null && status >= 200 && status < 300;
        // if (!isValid) {
        //   throw DioException.badResponse(
        //     statusCode: status!,
        //     requestOptions: response.requestOptions,
        //     response: response,
        //   );
        // }
        print('######## pull = $ddd');
        if (values.toString() == '200') {
          MyDialog().normalDialog(context, 'Pull Success', 'Success');
          // Navigator.pop(context, MaincctvReq());
        } else {
          MyDialog().normalDialog(context, 'Not Success', 'UnSuccess');
        }
      });
      // print('## value for API ===> $status');
    } on PlatformException {}
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: screens[currentIndex],
      // body: SingleChildScrollView(
      //   child: Padding(
      //     padding: EdgeInsets.all(15),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         const SizedBox(height: 15),
      //         Padding(
      //           padding: const EdgeInsets.only(top: 10),
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               IconButton(
      //                 style: IconButton.styleFrom(
      //                     backgroundColor: MyConstant.kprimaryColor,
      //                     padding: const EdgeInsets.all(20)),
      //                 onPressed: () {}, iconSize: 30, color: Colors.lightBlue,
      //                 icon: Icon(Icons.dashboard),
      //                 // icon: Image.asset(
      //                 //   "images/cctv2.jpg",
      //                 //   height: 20,
      //                 // ),
      //               ),
      //               Row(
      //                 children: [
      //                   Padding(
      //                     padding: const EdgeInsets.only(left: 5, right: 5),
      //                     child: IconButton(
      //                       style: IconButton.styleFrom(
      //                           backgroundColor: MyConstant.kprimaryColor,
      //                           padding: const EdgeInsets.all(20)),
      //                       iconSize: 30,
      //                       icon: const Icon(Icons.download),
      //                       color: Colors.red,
      //                       tooltip: 'Pull Hos',
      //                       onPressed: () {
      //                         setState(() {
      //                           Pull_hos();
      //                         });
      //                       },
      //                     ),
      //                   ),
      //                   IconButton(
      //                     style: IconButton.styleFrom(
      //                         backgroundColor: MyConstant.kprimaryColor,
      //                         padding: const EdgeInsets.all(20)),
      //                     onPressed: () {
      //                       setState(() {
      //                         Pull_authen();
      //                       });
      //                     },
      //                     iconSize: 30,
      //                     icon: Icon(Icons.download),
      //                     color: Color.fromARGB(255, 4, 197, 193),
      //                   ),
      //                   // Padding(
      //                   //   padding: const EdgeInsets.only(left: 10),
      //                   //   child: IconButton(
      //                   //     style: IconButton.styleFrom(
      //                   //         backgroundColor: MyConstant.kprimaryColor,
      //                   //         padding: const EdgeInsets.all(20)),
      //                   //     iconSize: 30,
      //                   //     icon: const Icon(Icons.logout), color: Colors.red,
      //                   //     tooltip: 'Logout', onPressed: () {},
      //                   //     // onPressed: () => signoutProcess(context),
      //                   //   ),
      //                   // ),
      //                 ],
      //               ),
      //             ],
      //           ),
      //         ),
      //         Container(
      //           child: Column(
      //             children: [
      //               Center(
      //                 child: Container(
      //                   height: 150,
      //                   width: 200,
      //                   decoration: BoxDecoration(
      //                     // shape: BoxShape.circle,
      //                     image: DecorationImage(
      //                         image: AssetImage("images/fdhss.png"),
      //                         fit: BoxFit.cover),
      //                   ),
      //                 ),
      //               ),
      //               // SizedBox(height: 5),
      //               // Text(
      //               //   "FDH",
      //               //   style:
      //               //       TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      //               // ),
      //             ],
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
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
}
