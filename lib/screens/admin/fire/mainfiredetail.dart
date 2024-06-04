import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pkofficer/models/firemodel.dart';
import 'package:pkofficer/utility/my_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainfireDetail extends StatefulWidget {
  const MainfireDetail({super.key});

  @override
  State<MainfireDetail> createState() => _MainfireDetailState();
}

class _MainfireDetailState extends State<MainfireDetail> {
  late String _scanBarcode = 'ยังไม่มีข้อมูล';
  late String barcodeScanRes = '';
  List<Firemodel> fireModel = [];
  List<Firemodel> searchfireModel = [];
  //  List<FireListmodel> firelistmodel = [];
  String? firenum;
  final debouncer = Debouncer(millisecond: 500);
  bool loadStatus = true;
  int index = 0;
  final formKey = GlobalKey<FormState>();
  // TextEditingController article_numController = TextEditingController();
  // TextEditingController check_dateController = TextEditingController();
  // TextEditingController camera_screenController = TextEditingController();

  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen((barcode) => print(barcode));
  }

  @override
  void initState() {
    super.initState();
    scanQR();
    // getdetail();
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

  Future<void> _refreshpage() async {
    return await Future.delayed(const Duration(seconds: 2));
  }

  Future<Null> getFiredata() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String id = preferences.getString('id')!;
    print('######## userid ************** = $id');

    String path =
        '${MyConstant.domain}/pkoffice/api/getfiredetail.php?isAdd=true&fire_id=$_scanBarcode';
    //  'http://192.168.0.217/pkbackoffice/public/api/getfire/F88888888';
    await Dio().get(path).then((value) async {
      String dd = value.toString();
      print('##*************** value for API  ==>  $value');
      for (var item in json.decode(value.data!)) {
        Firemodel model = Firemodel.fromJson(item);
        var fireId = model.fire_id!.toString();
        var fireNum = model.fire_num!.toString();
        print('###fire_id ==>>>$fireNum');
        setState(() {
          fireModel.add(model);
          firenum = fireNum;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Padding(
          padding: EdgeInsets.only(right: 50),
          child: Center(
            child: Text(
              'รายละเอียดถังดับเพลิง',
              // _gleaveModel.LEAVE_PERSON_FULLNAME,
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Kanit-Regular',
                  color: Colors.white),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Center(
            child: Container(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 3),
                    child: Text(
                      'ประวัติการตรวจเช็คถังดับเพลิง',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Text(
                    'รหัส :$firenum',
                    style: const TextStyle(fontSize: 18),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 15),
                    child: buildListView(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildListView() {
    return ListView.builder(
      // padding: EdgeInsets.only(top: 2),
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: searchfireModel.length,
      itemBuilder: (context, index) => Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            // Container(
            //   child: SlidableAction(
            //     onPressed: (context) {},
            //     backgroundColor: Color.fromARGB(255, 253, 158, 49),
            //     icon: Icons.edit_rounded,
            //   ),
            // ),
            // Container(
            //   child: SlidableAction(
            //     // onPressed: () => deletCheck(searcharticlecheckModel[index].cctv_check_id),
            //     onPressed: (context) {},
            //     backgroundColor: Color.fromARGB(255, 253, 23, 23),
            //     icon: Icons.delete,
            //   ),
            // ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 0, right: 0, top: 3, bottom: 3),
              child: Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: const Border(
                    top: BorderSide(color: Color.fromARGB(255, 102, 217, 252)),
                    left: BorderSide(color: Color.fromARGB(255, 102, 217, 252)),
                    right:
                        BorderSide(color: Color.fromARGB(255, 102, 217, 252)),
                    bottom:
                        BorderSide(color: Color.fromARGB(255, 102, 217, 252)),
                  ),
                  // color: Color(0xFFBFBFBF),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: MyConstant.shadowColor.withOpacity(0.05),
                      spreadRadius: 1.5,
                      blurRadius: 1.5,
                      offset: const Offset(0, 1),
                      // color: Colors.black26,
                      // offset: Offset(0, 2),
                      // blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Center(
                  child: ListTile(
                    leading: Text(
                      searchfireModel[index].fire_num!,
                      style: MyConstant().h5dark(),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          searchfireModel[index].fire_check_injection!,
                          style: MyConstant().h5dark(),
                        ),
                        Text(
                          searchfireModel[index].fire_check_joystick!,
                          style: MyConstant().h5dark(),
                        ),
                        Text(
                          searchfireModel[index].fire_check_body!,
                          style: MyConstant().h5dark(),
                        ),
                        Text(
                          searchfireModel[index].fire_check_gauge!,
                          style: MyConstant().h5dark(),
                        ),
                        Text(
                          searchfireModel[index].fire_check_drawback!,
                          style: MyConstant().h5dark(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  dynamic textNum() {
    return Container(
        child: Text(
      'รหัสถังดับเพลิง : $_scanBarcode\n',
      style: const TextStyle(fontSize: 20),
    ));
  }
}

class Debouncer {
  final int millisecond;
  Timer? timer;
  VoidCallback? callback;

  Debouncer({required this.millisecond});

  run(VoidCallback callback) {
    if (null != timer) {
      timer!.cancel();
    }
    timer = Timer(Duration(milliseconds: millisecond), callback);
  }
}
