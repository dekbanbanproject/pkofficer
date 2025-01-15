import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:pkofficer/models/firelistmodel.dart';
import 'package:pkofficer/models/firemodel.dart';
import 'package:pkofficer/utility/my_constant.dart';
import 'package:pkofficer/utility/my_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainFireadd extends StatefulWidget {
  const MainFireadd({super.key});

  @override
  State<MainFireadd> createState() => _MainFireaddState();
}

class _MainFireaddState extends State<MainFireadd> {
  late String _scanBarcode = 'ยังไม่มีข้อมูล';
  int index = 0;
  final formKey = GlobalKey<FormState>();
  // TextEditingController fire_numController = TextEditingController();
  // TextEditingController check_dateController = TextEditingController();
  // TextEditingController camera_screenController = TextEditingController();

  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen((barcode) => print(barcode));
  }

  late String barcodeScanRes = '';
  late String getbarcodeScanRes = '';
  late String fireStatus = '';
  late String fire_num = '';
  late String injectionStatus = '';
  late String joystickStatus = '';
  late String bodyStatus = '';
  late String gaugeStatus = '';
  late String drawbackStatus = '';
  List<FireListmodel> firelistmodel = [];
  List<Firemodel> fireModel = [];
  String? firenum,fireid,firenums;


  @override
  void initState() {
    super.initState();
    // scanQR();
  }

  Future<void> scanQR() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      // print(barcodeScanRes);
      // print('## value for API ===> $barcodeScanRes');
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
     
      listFire();
      // getFiredata();
    });
  }

  // void clearField() {
  //   injectionStatus;
  //   joystickStatus;
  //   barcodeScanRes;
  // }

  Future<void> _refreshpage() async {
    // return await Future.delayed(const Duration(seconds: 2));
    setState(() => injectionStatus.isEmpty);
  }
 

   Future<Null> listFire() async {
    if (fireModel.isNotEmpty) {
      fireModel.clear();
    } else {}
    final apifire = '${MyConstant.domain}/pkoffice/api/fire.php?isAdd=true&fire_id=$_scanBarcode';
    await Dio().get(apifire).then((value) async {
      print('## value for API  ==>  $value');
      for (var item in json.decode(value.data!)) {
        Firemodel model = Firemodel.fromJson(item);
        var firenum = model.fire_num!.toString();
         var fireid = model.fire_id!.toString();
         print('### ==>>>==========>>>> $fireid');
        print('### ==>>>==========>>>> $firenum');
        setState(() {
          fireModel.add(model);
          // fire_nums = fireModel.toString();
          firenums = firenum;
        });
        print('### ==>>>==========>>>> $firenums');
      }
    });
  }


//   Future<Null> getFiredata() async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     String id = preferences.getString('id')!;
//     print('######## => userid = $id');
//     // print('######## => Active = $fireStatus');

// //  final apifire = '${MyConstant.domain}/pkoffice/api/getfire_detailsave.php?isAdd=true&fire_num=$_scanBarcode';
//     // String apifire =
//         // '${MyConstant.domain}/pkoffice/api/getfire_detailsave.php?isAdd=true&fireNum=$_scanBarcode';
//     // final path = '${MyConstant.getFiredata}fire_id=$_scanBarcode';
//     //  final path = '${MyConstant.getFiredata}fireNum=$_scanBarcode';
//       // final path = '${MyConstant.domain}/pkoffice/api/getFiredata.php?isAdd=true';
//     //  'http://192.168.0.217/pkbackoffice/public/api/getfire/F88888888';
//      print('##scanBarcode  ====>>>==>$_scanBarcode');
//  final apifire2 = '${MyConstant.domain}/pkoffice/api/getfire_detailsave.php?isAdd=true&fire_num=$_scanBarcode';
// //  final apifire = '${MyConstant.domain}/pkoffice/api/getfire_detailsave.php?isAdd=true&fire_num=FR020104';
//   //  final apifire = MyConstant.getfirenumnew;
     
//     await Dio().get(apifire2).then((value) async {
//       // String dd = value.toString();
//       print('## value for API  ====>>>==>  $value');
//       for (var item in json.decode(value.data!)) {
//         // FireListmodel model = FireListmodel.fromJson(item);
//         Firemodel model = Firemodel.fromJson(item);
//         var fireId = model.fire_id!.toString();
//         var fireNum = model.fire_num!.toString();
//         print('###fireNum ======================================== >>>$fireNum');
//         print('###fireId  =========================================== >>>$fireId');
//         setState(() {
//           fireModel.add(model);
//           firenum = fireNum;
//           fireid  = fireId;
//         });
//       }

     

//     });
//   }
   

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
 
      body: LiquidPullToRefresh(
        onRefresh: _refreshpage,
        color: Colors.deepPurple, height: 200,
        backgroundColor: Colors.deepPurple[200],
        animSpeedFactor: 2,
        showChildOpacityTransition: true,
        child: ListView(
          // child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: MaterialButton(
                    onPressed: () {
                      // scanbarcodenew();
                      scanQR();
                    },
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 60,
                          child: Icon(
                            Icons.qr_code_scanner_sharp,
                            color: Colors.orange,
                            size: 60,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Center(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                const Text('SCAN QRCODE FIRE EXTINGUISHER'),
                const Center(
                  child: SizedBox(
                    height: 3,
                  ),
                ),
                // textNum(),

                Text(
                  'รหัสถังดับเพลิง :$firenums',
                  // 'รหัสถังดับเพลิง : $firenum',
                  style: const TextStyle(fontSize: 18),
                ),

                // Text(
                //   fireModel[index]
                //       .fire_num!,
                //   style: MyConstant().h4darknarmal(),),

                Padding(
                  padding: const EdgeInsets.only(
                    top: 15,
                    bottom: 10,
                    left: 10,
                    right: 10,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      border: const Border(
                        top: BorderSide(
                            color: Color.fromARGB(255, 102, 217, 252)),
                        left: BorderSide(
                            color: Color.fromARGB(255, 102, 217, 252)),
                        right: BorderSide(
                            color: Color.fromARGB(255, 102, 217, 252)),
                        bottom: BorderSide(
                            color: Color.fromARGB(255, 102, 217, 252)),
                      ),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(221, 255, 255, 255)
                              .withOpacity(0.05),
                          spreadRadius: 1.5,
                          blurRadius: 1.5,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Card(
                      color: Colors.white,
                      child: ListTile(
                        leading: const Text(
                          'สายฉีด',
                          style: TextStyle(fontSize: 17),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            injectionRadio(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 3, bottom: 10, left: 10, right: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      border: const Border(
                        top: BorderSide(
                            color: Color.fromARGB(255, 102, 217, 252)),
                        left: BorderSide(
                            color: Color.fromARGB(255, 102, 217, 252)),
                        right: BorderSide(
                            color: Color.fromARGB(255, 102, 217, 252)),
                        bottom: BorderSide(
                            color: Color.fromARGB(255, 102, 217, 252)),
                      ),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(221, 255, 255, 255)
                              .withOpacity(0.05),
                          spreadRadius: 1.5,
                          blurRadius: 1.5,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Card(
                      color: Colors.white,
                      child: ListTile(
                        leading: const Text(
                          'คันบังคับ',
                          style: TextStyle(fontSize: 17),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            joystickRadio(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 3, bottom: 10, left: 10, right: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      border: const Border(
                        top: BorderSide(
                            color: Color.fromARGB(255, 102, 217, 252)),
                        left: BorderSide(
                            color: Color.fromARGB(255, 102, 217, 252)),
                        right: BorderSide(
                            color: Color.fromARGB(255, 102, 217, 252)),
                        bottom: BorderSide(
                            color: Color.fromARGB(255, 102, 217, 252)),
                      ),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(221, 255, 255, 255)
                              .withOpacity(0.05),
                          spreadRadius: 1.5,
                          blurRadius: 1.5,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Card(
                      color: Colors.white,
                      child: ListTile(
                        leading: const Text(
                          'ตัวถัง',
                          style: TextStyle(fontSize: 17),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            bodyRadio(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 3, bottom: 10, left: 10, right: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      border: const Border(
                        top: BorderSide(
                            color: Color.fromARGB(255, 102, 217, 252)),
                        left: BorderSide(
                            color: Color.fromARGB(255, 102, 217, 252)),
                        right: BorderSide(
                            color: Color.fromARGB(255, 102, 217, 252)),
                        bottom: BorderSide(
                            color: Color.fromARGB(255, 102, 217, 252)),
                      ),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(221, 255, 255, 255)
                              .withOpacity(0.05),
                          spreadRadius: 1.5,
                          blurRadius: 1.5,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Card(
                      color: Colors.white,
                      child: ListTile(
                        leading: const Text(
                          'เกจความดัน',
                          style: TextStyle(fontSize: 17),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            gaugeRadio(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 3, bottom: 2, left: 10, right: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      border: const Border(
                        top: BorderSide(
                            color: Color.fromARGB(255, 102, 217, 252)),
                        left: BorderSide(
                            color: Color.fromARGB(255, 102, 217, 252)),
                        right: BorderSide(
                            color: Color.fromARGB(255, 102, 217, 252)),
                        bottom: BorderSide(
                            color: Color.fromARGB(255, 102, 217, 252)),
                      ),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(221, 255, 255, 255)
                              .withOpacity(0.05),
                          spreadRadius: 1.5,
                          blurRadius: 1.5,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Card(
                      color: Colors.white,
                      child: ListTile(
                        leading: const Text(
                          'สิ่งกีดขวาง',
                          style: TextStyle(fontSize: 17),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            drawbackRadio(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            saveButtom(size),
          ],
        ),
        //  onRefresh: onRefresh
      ),
    );
  }

// dynamic saveButtom() => saveButtom();
  Row saveButtom(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          width: size * 0.5,
          child: Padding(
            padding: const EdgeInsets.only(top: 2,bottom: 30),
            child: ElevatedButton.icon(
              icon: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(
                  Icons.save_as,
                  color: Color.fromARGB(255, 8, 190, 166),
                  size: 30.0,
                ),
              ),
              label: Text(
                'บันทึก',
                style: MyConstant().h1save(),
              ),
              onPressed: () => comfirmDialog(),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  backgroundColor: const Color.fromARGB(255, 222, 248, 244)),
            ),
          ),
        ),
      ],
    );
  }

  Future<Null> comfirmDialog() async {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('บันทึกข้อมูลใช่ไหม ?'),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: ElevatedButton.icon(
                  label: Text(
                    ' Yes',
                    style: MyConstant().h2save(),
                  ),
                  onPressed: () {
                    if ( firenum =='' ) {
                      MyDialog().normalDialog(context, 'ยังไม่ได้สแกน QRCODE', 'รหัสถังดับเพลิงว่าง');
                       
                      // setState(() {  
                      //   barcodeScanRes = '';
                      //   injectionStatus = '';
                      //   joystickStatus = '';
                      //   bodyStatus = '';
                      //   gaugeStatus = '';
                      //   drawbackStatus = '';
                      // });
                    }else if (injectionStatus.isEmpty ||
                        joystickStatus.isEmpty ||
                        bodyStatus.isEmpty ||
                        gaugeStatus.isEmpty ||
                        drawbackStatus.isEmpty){
                           MyDialog().normalDialog(context, 'ยังไม่ได้เลือกข้อมูล', 'ข้อมูลว่าง');
                    } else {
                      Navigator.pop(context);
                      saveActive();
                    }
                  },
                  // onPressed: () => comfirmDialog(),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      backgroundColor:
                          const Color.fromARGB(255, 222, 248, 244)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Container(
                  child: ElevatedButton.icon(
                    label: Text(
                      'No',
                      style: MyConstant().h2save(),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      // clearField();
                      setState(() {
                        barcodeScanRes = '';
                        injectionStatus = '';
                        joystickStatus = '';
                        bodyStatus = '';
                        gaugeStatus = '';
                        drawbackStatus = '';
                      });
                    },

                    // onPressed: () => comfirmDialog(),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        backgroundColor: Color.fromARGB(255, 248, 222, 229)),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<Null> SuccessDialog() async {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('บันทึกข้อมูลสำเร็จ'),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: ElevatedButton.icon(
                  label: Text(
                    ' Close',
                    style: MyConstant().h2save(),
                  ),
                  onPressed: () {
                    final route =
                        MaterialPageRoute(builder: (context) => MainFireadd());
                    // Navigator.popUntil(context,ModalRoute.withName('/routeFireaddPage'));
                    Navigator.pushAndRemoveUntil(
                        context, route, (route) => false);
                    //     Navigator.pushNamedAndRemoveUntil(
                    // context, MyConstant.routeFireaddPage, (route) => false);
                    setState(() {
                      barcodeScanRes = '';
                      injectionStatus = '';
                      joystickStatus = '';
                      bodyStatus = '';
                      gaugeStatus = '';
                      drawbackStatus = '';
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      backgroundColor:
                          const Color.fromARGB(255, 222, 248, 244)),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<Null> saveActive() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    String id = preferences.getString('id')!;
    // String article_num2 = article_numController.text;
    print('######## userid = $id');
    print('######## Active = $fireStatus');
// fireId
    String path =
        // '${MyConstant.domain}/pkoffice/api/getfireinsert.php?isAdd=true&fire_num=$_scanBarcode&user_id=$id&fire_check_injection=$injectionStatus&fire_check_joystick=$joystickStatus&fire_check_body=$bodyStatus&fire_check_gauge=$gaugeStatus&fire_check_drawback=$drawbackStatus';
         '${MyConstant.domain}/pkoffice/api/getfireinsert.php?isAdd=true&fire_id=$_scanBarcode&user_id=$id&fire_check_injection=$injectionStatus&fire_check_joystick=$joystickStatus&fire_check_body=$bodyStatus&fire_check_gauge=$gaugeStatus&fire_check_drawback=$drawbackStatus';
    await Dio().get(path).then((value) async {
      String dd = value.toString();
      print('######## Vaaaaaaaaaa = $dd');
      if (value.toString() == 'false') {
        MyDialog().normalDialog(context, 'บันทึกไปแล้ว', 'ข้อมูลซ้ำ');
        // SuccessDialog();
      } else {
        //  MyDialog().normalDialog(context, 'บันทึกไปแล้ว', 'ข้อมูลซ้ำ');
        SuccessDialog();
        // Navigator.pop(context);
        // setState(() {
        //   barcodeScanRes = '';
        //   injectionStatus = '';
        //   joystickStatus = '';
        //   bodyStatus = '';
        //   gaugeStatus = '';
        //   drawbackStatus = '';
        // });
        // Navigator.pop(context, const MaincctvReq());
        // joystickRadio();
        // Navigator.pop(context, const MainFireadd());
        // Navigator.pop(context);
        //  MainFireadd
        // setState(() {
        // joystickRadio();
        //   clearField();
        //   injectionStatus.isEmpty;
        //   joystickStatus.isEmpty;
        //   barcodeScanRes.isEmpty;
        // });
      }
    });
  }

  Widget injectionRadio() => Container(
        child: Row(
          children: <Widget>[
            Radio(
              value: '0',hoverColor: Color.fromARGB(255, 45, 240, 223),
              groupValue: injectionStatus,
              onChanged: (value) {
                setState(() {
                  injectionStatus = value!;
                });
              },
            ),
            const Text('ปกติ',style: TextStyle(fontSize: 17)),
            Radio(
                activeColor: Colors.pink,
              value: '1',
              groupValue: injectionStatus,
              onChanged: (value) {
                setState(() {
                  injectionStatus = value!;
                });
              },
            ),
            const Text('ชำรุด',style: TextStyle(fontSize: 17)),
          ],
        ),
      );

  Widget joystickRadio() => Container(
        child: Row(
          children: <Widget>[
            Radio(
              value: '0',
              groupValue: joystickStatus,
              onChanged: (value) {
                setState(() {
                  joystickStatus = value!;
                });
              },
            ),
            const Text('ปกติ',style: TextStyle(fontSize: 17)),
            Radio(
                activeColor: Colors.pink,
              value: '1',
              groupValue: joystickStatus,
              onChanged: (value) {
                setState(() {
                  joystickStatus = value!;
                });
              },
            ),
            const Text('ชำรุด',style: TextStyle(fontSize: 17)),
          ],
        ),
      );

  Widget bodyRadio() => Container(
        child: Row(
          children: <Widget>[
            Radio(
              value: '0',
              groupValue: bodyStatus,
              onChanged: (value) {
                setState(() {
                  bodyStatus = value!;
                });
              },
            ),
            const Text('ปกติ',style: TextStyle(fontSize: 17)),
            Radio(  activeColor: Colors.pink,
              value: '1',
              groupValue: bodyStatus,
              onChanged: (value) {
                setState(() {
                  bodyStatus = value!;
                });
              },
            ),
            const Text('ชำรุด',style: TextStyle(fontSize: 17)),
          ],
        ),
      );

  Widget gaugeRadio() => Container(
        child: Row(
          children: <Widget>[
            Radio(
              value: '0',
              groupValue: gaugeStatus,
              onChanged: (value) {
                setState(() {
                  gaugeStatus = value!;
                });
              },
            ),
            const Text('ปกติ',style: TextStyle(fontSize: 17)),
            Radio(  activeColor: Colors.pink,
              value: '1',
              groupValue: gaugeStatus,
              onChanged: (value) {
                setState(() {
                  gaugeStatus = value!;
                });
              },
            ),
            const Text('ชำรุด',style: TextStyle(fontSize: 17)),
          ],
        ),
      );

  Widget drawbackRadio() => Container(
        child: Row(
          children: <Widget>[
            Radio(
              value: '0',
              groupValue: drawbackStatus,
              onChanged: (value) {
                setState(() {
                  drawbackStatus = value!;
                });
              },
            ),
            const Text('ปกติ',style: TextStyle(fontSize: 17)),
            Radio(  activeColor: Colors.pink,
              value: '1',
              groupValue: drawbackStatus,
              onChanged: (value) {
                setState(() {
                  drawbackStatus = value!;
                });
              },
            ),
            const Text('ชำรุด',style: TextStyle(fontSize: 17)),
          ],
        ),
      );
}
