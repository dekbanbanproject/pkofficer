import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pkofficer/states/cameracctv.dart';
import 'package:pkofficer/states/signout.dart';
import 'package:pkofficer/utility/my_constant.dart';
import 'package:pkofficer/widgets/list_cctv.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  late Widget currentWidget;
  // Widget currentWidget = ListCctv();
  List<Widget> itemData = [];
  IconData? iconSharp;
  var onPressedFunc = () => {};
  int _index = 0;
  int indexPage = 0;
  late String scanresult;
  late String code = "";
  late String getcode = "";
  late String _scanBarcode = 'ยังไม่มีข้อมูล';
  List<Widget> listWidget = [const CameraCCtv()];
  final List<Widget> screenTap = [
    const CameraCCtv(),
  ];
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    currentWidget = const ListCctv();
  }

  BottomNavigationBarItem cctvPage() {
    return const BottomNavigationBarItem(
      icon: Icon(Icons.restaurant_menu),
    );
    // qr_code_2_sharp
  }

  BottomNavigationBarItem aboutNav() {
    return const BottomNavigationBarItem(icon: Icon(Icons.qr_code_2));
  }

  startScan() async {
    // print('OK');
    //อ่านข้อมูลจาก Barcode และ QRCODE
    String? cameraScanResult = await scanner.scan();
    setState(() {
      scanresult = cameraScanResult!;
    });
  }

  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen((barcode) => print(barcode));
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 232, 240),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 145, 220, 255),
        title: Text(
          'CCTV Service',
          style: MyConstant().h1dark(),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Version',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Version 670305')));
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () => signoutProcess(context),
            // onPressed: () {
            //   // Navigator.pushNamedAndRemoveUntil(
            //   //     context, MyConstant.routeLogin, (route) => false);
            //   MaterialPageRoute route = MaterialPageRoute(
            //     builder: (context) => Login(),
            //   );
            //   Navigator.pushAndRemoveUntil(context, route, (route) => false);
            // },
          ),
        ],
      ),
      // body: Builder(
      //   builder: (BuildContext context) {
      //     return Container(

      //       child: Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Container(
      //           child: SizedBox(
      //             height: 300,
      //             width: double.infinity,
      //             child: Card(
      //               child: Padding(
      //                 padding: const EdgeInsets.all(8.0),
      //                 child: Column(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     Text(
      //                       'Scan result : $_scanBarcode\n',
      //                       style: TextStyle(fontSize: 20),
      //                     )
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ),
      //       ),
      //     );
      //   },
      // ),
      body: currentWidget,
      // body: listWidget[indexPage],
      // bottomNavigationBar: showButtonNavigator(),
      // floatingActionButton: FloatingActionButton(
      // onPressed: () => scanQR(),
      // tooltip: 'Start scan',
      // child: const Icon(Icons.qr_code_scanner_sharp),
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // MaterialButton(
              //   minWidth: 90,
              //   onPressed: () {
              //     Navigator.pushNamed(
              // context, MyConstant.routeCameracctv);
              //   },
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Icon(
              //         Icons.qr_code_2_sharp,
              //         color: _index == 0 ? Colors.orange : Colors.grey,
              //       ),
              //     ],
              //   ),
              // ),
              MaterialButton(
                minWidth: 20,
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                    currentWidget = const ListCctv();
                    _index = 0;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.qr_code_scanner_sharp,
                      color: _index == 0 ? Colors.orange : Colors.grey,
                    ),
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 20,
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                    currentWidget = const CameraCCtv();
                    _index = 1;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.dashboard,
                      color: _index == 1 ? Colors.orange : Colors.grey,
                    ),
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 20,
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                    currentWidget = const ListCctv();
                    _index = 2;
                  });
                  // Navigator.pop(context);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.assignment_ind_rounded,
                      //  Icons.calendar_today,
                      color: _index == 2 ? Colors.orange : Colors.grey,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//   BottomNavigationBar showButtonNavigator() => BottomNavigationBar(
//         // onTap: (value) {
//         //   setState(() {
//         //     indexPage = value;
//         //   });
//         // },
//         items: <BottomNavigationBarItem>[cctvPage(),aboutNav()],
//       );
// }
      // bottomNavigationBar: showButtonNavigator(),    
// }
//   BottomNavigationBar showButtonNavigator() => BottomNavigationBar(
//         onTap: (value) {
//           setState(() {
//             indexPage = value;
//           });
//         },
//         items: <BottomNavigationBarItem>[cctvPage()],
//       );
// }
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: startScan,
    //     child: Icon(Icons.qr_code_scanner_sharp),
    //   ),
    //   floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    //   bottomNavigationBar: BottomAppBar(
    //     // shape: CircularNotchedRectangle(),
    //     // notchMargin: 10,
    //     child: Container(
    //       height: 50,
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Row(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               MaterialButton(
    //                 minWidth: 90,
    //                 onPressed: () {},
    //                 child: Column(
    //                   mainAxisAlignment: MainAxisAlignment.center,
    //                   children: [
    //                     Icon(
    //                       Icons.qr_code_2_sharp,
    //                       color: _index == 0 ? Colors.orange : Colors.grey,
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               MaterialButton(
    //                 minWidth: 90,
    //                 onPressed: () {},
    //                 child: Column(
    //                   mainAxisAlignment: MainAxisAlignment.center,
    //                   children: [
    //                     Icon(
    //                       Icons.qr_code,
    //                       color: _index == 1 ? Colors.orange : Colors.grey,
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               MaterialButton(
    //                 minWidth: 90,
    //                 onPressed: () {},
    //                 child: Column(
    //                   mainAxisAlignment: MainAxisAlignment.center,
    //                   children: [
    //                     Icon(
    //                       Icons.camera,
    //                       color: _index == 1 ? Colors.orange : Colors.grey,
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  // }
// }
//   BottomNavigationBar showButtonNavigator() => BottomNavigationBar(
//         onTap: (value) {
//           setState(() {
//             indexPage = value;
//           });
//         },
//         items: <BottomNavigationBarItem>[cctvPage()],
//       );
// }
