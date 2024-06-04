import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pkofficer/models/article_model_check.dart';
import 'package:pkofficer/utility/my_constant.dart';

class MainCctvdetail extends StatefulWidget {
  const MainCctvdetail({super.key});

  @override
  State<MainCctvdetail> createState() => _MainCctvdetailState();
}

class _MainCctvdetailState extends State<MainCctvdetail> {
  late String _scanBarcode = 'ยังไม่มีข้อมูล';
  late String barcodeScanRes = '';
  List<ArticleCheckModel> articlecheckModel = [];
  List<ArticleCheckModel> searcharticlecheckModel = [];
  final debouncer = Debouncer(millisecond: 500);
  bool loadStatus = true;
  int index = 0;
  final formKey = GlobalKey<FormState>();
  TextEditingController article_numController = TextEditingController();
  TextEditingController check_dateController = TextEditingController();
  TextEditingController camera_screenController = TextEditingController();

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
      print('## value for API ===> $barcodeScanRes');
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() async {
      _scanBarcode = barcodeScanRes;

      String path =
          '${MyConstant.domain}/pkoffice/api/getArticledetail.php?isAdd=true&article_num=$_scanBarcode';
      await Dio().get(path).then((value) async {
        print('###get ==>>>$value');
        for (var item in json.decode(value.data!)) {
          ArticleCheckModel model = ArticleCheckModel.fromJson(item);
          var cctvname = model.articleNum!.toString();
          print('### ==>>>$cctvname');
          setState(() {
            articlecheckModel.add(model);
            searcharticlecheckModel = articlecheckModel;
          });
        }
      });
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
              'รายละเอียดกล้องวงจรปิด',
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
                      'ประวัติการตรวจเช็คกล้อง',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Text(
                    'รหัส :$_scanBarcode',
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
      itemCount: searcharticlecheckModel.length,
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
                      searcharticlecheckModel[index].articleNum!,
                      style: MyConstant().h5dark(),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          searcharticlecheckModel[index].cctv_check_date!,
                          style: MyConstant().h5dark(),
                        ),
                        Text(
                          searcharticlecheckModel[index].cctv_camera_screen!,
                          style: MyConstant().h5dark(),
                        ),
                        Text(
                          searcharticlecheckModel[index].cctv_camera_corner!,
                          style: MyConstant().h5dark(),
                        ),
                        Text(
                          searcharticlecheckModel[index].cctv_camera_drawback!,
                          style: MyConstant().h5dark(),
                        ),
                        Text(
                          searcharticlecheckModel[index].cctv_camera_save!,
                          style: MyConstant().h5dark(),
                        ),
                        Text(
                          searcharticlecheckModel[index]
                              .cctv_camera_power_backup!,
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
      'รหัสกล้องวงจรปิด : $_scanBarcode\n',
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
