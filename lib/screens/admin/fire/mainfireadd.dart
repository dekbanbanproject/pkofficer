import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:pkofficer/models/firelistmodel.dart';
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
  String? firenum;

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
      getFiredata();
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

  Future<Null> getFiredata() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String id = preferences.getString('id')!;
    print('######## userid = $id');
    print('######## Active = $fireStatus');

    // String path =
    //     '${MyConstant.domain}/pkoffice/api/getfire_detailsave.php?isAdd=true&fire_id=$_scanBarcode';
    final path = '${MyConstant.getFiredata}fire_id=$_scanBarcode';
    //  'http://192.168.0.217/pkbackoffice/public/api/getfire/F88888888';
    await Dio().get(path).then((value) async {
      String dd = value.toString();
      print('## value for API  ==>  $value');
      for (var item in json.decode(value.data!)) {
        FireListmodel model = FireListmodel.fromJson(item);
        var fireId = model.fire_id!.toString();
        var fireNum = model.fire_num!.toString();
        print('###fire_id ==>>>$fireNum');
        setState(() {
          firelistmodel.add(model);
          firenum = fireNum;
        });
      }
    });
  }
  // Future<List<FireListmodel>> getFiredata() async {
  //   final response = await http.get(Uri.parse(
  //       'http://192.168.0.217/pkbackoffice/public/api/getfire/F88888888'));
  //   var data = jsonDecode(response.body.toString());
  //   print('## value Alll for API  ==>  $data');
  //   if (response.statusCode == 200) {
  //     firelistmodel.clear();
  //     for (var i in data) {
  //       firelistmodel.add(FireListmodel.fromJson(i));
  //       // FireListmodel model = FireListmodel.fromJson(i);
  //       // var fire_id = model.fire_id!.toString();
  //        print('## value fire_id for API  ==>  $firelistmodel');
  //     }
  //     return firelistmodel;
  //   } else {
  //     return firelistmodel;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: const Color.fromARGB(255, 222, 248, 244),
      //   title: const Padding(
      //     padding: EdgeInsets.only(right: 30),
      //     child: Center(
      //       child: Text(
      //         'บันทึกข้อมูลถังดับเพลิง',
      //         // _gleaveModel.LEAVE_PERSON_FULLNAME,
      //         style: TextStyle(
      //             fontSize: 20,
      //             fontFamily: 'Kanit-Regular',
      //             color: Color.fromARGB(255, 8, 190, 166)),
      //       ),
      //     ),
      //   ),
      // ),
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
                          radius: 50,
                          child: Icon(
                            Icons.qr_code_scanner_sharp,
                            color: Colors.orange,
                            size: 50,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Center(
                  child: SizedBox(
                    height: 3,
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
                  // 'รหัสถังดับเพลิง :$_scanBarcode',
                  'รหัสถังดับเพลิง : $firenum',
                  style: const TextStyle(fontSize: 18),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 15,
                    bottom: 3,
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
                      top: 3, bottom: 3, left: 10, right: 10),
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
                      top: 3, bottom: 3, left: 10, right: 10),
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
                      top: 3, bottom: 3, left: 10, right: 10),
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
                      top: 3, bottom: 3, left: 10, right: 10),
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
          margin: const EdgeInsets.symmetric(vertical: 18),
          width: size * 0.6,
          child: Padding(
            padding: const EdgeInsets.only(top: 3),
            child: ElevatedButton.icon(
              icon: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(
                  Icons.save,
                  color: Color.fromARGB(255, 8, 190, 166),
                  size: 30.0,
                ),
              ),
              label: Text(
                'Save',
                style: MyConstant().h2save(),
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
                    if (injectionStatus.isEmpty ||
                        joystickStatus.isEmpty ||
                        bodyStatus.isEmpty ||
                        gaugeStatus.isEmpty ||
                        drawbackStatus.isEmpty) {
                      MyDialog().normalDialog(
                          context, 'ยังไม่ได้เลือก', 'ข้อมูลว่าง');
                      //  return
                      // Navigator.pop(context);
                    } else {
                      // Navigator.pop(context);
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

    String path =
        '${MyConstant.domain}/pkoffice/api/getfireinsert.php?isAdd=true&fire_id=$_scanBarcode&user_id=$id&fire_check_injection=$injectionStatus&fire_check_joystick=$joystickStatus&fire_check_body=$bodyStatus&fire_check_gauge=$gaugeStatus&fire_check_drawback=$drawbackStatus';
    await Dio().get(path).then((value) async {
      String dd = value.toString();
      print('######## Vaaaaaaaaaa = $dd');
      if (value.toString() == 'false') {
        MyDialog().normalDialog(context, 'บันทึกไปแล้ว', 'ข้อมูลซ้ำ');
      } else {
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
              value: '0',
              groupValue: injectionStatus,
              onChanged: (value) {
                setState(() {
                  injectionStatus = value!;
                });
              },
            ),
            const Text('ปกติ'),
            Radio(
              value: '1',
              groupValue: injectionStatus,
              onChanged: (value) {
                setState(() {
                  injectionStatus = value!;
                });
              },
            ),
            const Text('ชำรุด'),
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
            const Text('ปกติ'),
            Radio(
              value: '1',
              groupValue: joystickStatus,
              onChanged: (value) {
                setState(() {
                  joystickStatus = value!;
                });
              },
            ),
            const Text('ชำรุด'),
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
            const Text('ปกติ'),
            Radio(
              value: '1',
              groupValue: bodyStatus,
              onChanged: (value) {
                setState(() {
                  bodyStatus = value!;
                });
              },
            ),
            const Text('ชำรุด'),
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
            const Text('ปกติ'),
            Radio(
              value: '1',
              groupValue: gaugeStatus,
              onChanged: (value) {
                setState(() {
                  gaugeStatus = value!;
                });
              },
            ),
            const Text('ชำรุด'),
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
            const Text('ปกติ'),
            Radio(
              value: '1',
              groupValue: drawbackStatus,
              onChanged: (value) {
                setState(() {
                  drawbackStatus = value!;
                });
              },
            ),
            const Text('ชำรุด'),
          ],
        ),
      );
}
