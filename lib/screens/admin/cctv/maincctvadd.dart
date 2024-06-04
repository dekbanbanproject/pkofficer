import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:pkofficer/models/article_model.dart';
import 'package:pkofficer/models/article_model_check.dart';
import 'package:pkofficer/utility/my_constant.dart';
import 'package:pkofficer/utility/my_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainCctvAdd extends StatefulWidget {
  const MainCctvAdd({super.key});

  @override
  State<MainCctvAdd> createState() => _MainCctvAddState();
}

class _MainCctvAddState extends State<MainCctvAdd> {
  late String _scanBarcode = 'ยังไม่มีข้อมูล';
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

  late String barcodeScanRes = '';
  late String getbarcodeScanRes = '';
  late String cctvStatus = '';
  late String articlenum = '';
  late String connerStatus = '';
  late String drawbackStatus = '';
  late String saveStatus = '';
  late String powerStatus = '';
  List<ArticleModel> articleModel = [];
  List<ArticleCheckModel> articlecheckModel = [];
  List<ArticleCheckModel> searcharticlecheckModel = [];

  @override
  void initState() {
    super.initState();
    scanQR();
    // listcctv();
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

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  Future<void> _refreshpage() async {
    return await Future.delayed(const Duration(seconds: 2));
  }

  // Future<Null> listcctv() async {
  //   final apicctv =
  //       '${MyConstant.domain}/pkoffice/api/getcctv_lastsave.php?isAdd=true';
  //   await Dio().get(apicctv).then((value) async {
  //     print('## value for API  ==>  $value');
  //     for (var item in json.decode(value.data!)) {
  //       ArticleCheckModel model = ArticleCheckModel.fromJson(item);
  //       var cctvname = model.articleNum!.toString();
  //       print('### ==>>>$cctvname');
  //       setState(() {
  //         articlecheckModel.add(model);
  //         searcharticlecheckModel = articlecheckModel;
  //       });
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 222, 248, 244),
        title: const Padding(
          padding: EdgeInsets.only(right: 30),
          child: Center(
            child: Text(
              'บันทึกข้อมูลกล้องวงจรปิด',
              // _gleaveModel.LEAVE_PERSON_FULLNAME,
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Kanit-Regular',
                  color: Colors.white),
            ),
          ),
        ),
      ),
      body: LiquidPullToRefresh(
        onRefresh: _refreshpage,
        color: Colors.deepPurple, height: 300,
        backgroundColor: Colors.deepPurple[200],
        animSpeedFactor: 2,
        showChildOpacityTransition: true,
        child: ListView(
          // child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15),
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
                const Text('SCAN QRCODE CCTV'),
                const Center(
                  child: SizedBox(
                    height: 3,
                  ),
                ),
                // textNum(),
                Text(
                  'รหัสกล้องวงจรปิด :$_scanBarcode',
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
                      child: ListTile(
                        leading: const Text(
                          'จอกล้อง',
                          style: TextStyle(fontSize: 17),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            damagedRadio(),
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
                      child: ListTile(
                        leading: const Text(
                          'มุมกล้อง',
                          style: TextStyle(fontSize: 17),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            damagedconerRadio(),
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
                      child: ListTile(
                        leading: const Text(
                          'สิ่งกีดขวาง',
                          style: TextStyle(fontSize: 17),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            damageddrawbackRadio(),
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
                      child: ListTile(
                        leading: const Text(
                          'การบันทึก',
                          style: TextStyle(fontSize: 17),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            damagedsaveRadio(),
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
                      child: ListTile(
                        leading: const Text(
                          'การสำรองไฟ',
                          style: TextStyle(fontSize: 17),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            damagedpowerRadio(),
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
          // Center(
          //   child: OutlinedButton(
          //     onPressed: () {
          //       Navigator.pop(context);
          //       updateActive();
          //       // editActive();
          //     },
          //     child: Text('ใช่'),
          //   ),
          // )
          Center(
            child: ElevatedButton.icon(
              label: Text(
                ' Yes',
                style: MyConstant().h2save(),
              ),
              onPressed: () {
                Navigator.pop(context);
                updateActive();
              },
              // onPressed: () => comfirmDialog(),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  backgroundColor: const Color.fromARGB(255, 222, 248, 244)),
            ),
          )
        ],
      ),
    );
  }

  Widget normalRadio() => Container(
        child: const Row(
          children: <Widget>[
            Text(
              'จอกล้อง',
              style: TextStyle(fontSize: 17),
            ),
          ],
        ),
      );

  Widget damagedRadio() => Container(
        child: Row(
          children: <Widget>[
            Radio(
              value: '0',
              groupValue: cctvStatus,
              onChanged: (value) {
                setState(() {
                  cctvStatus = value!;
                });
              },
            ),
            const Text('ปกติ'),
            Radio(
              value: '1',
              groupValue: cctvStatus,
              onChanged: (value) {
                setState(() {
                  cctvStatus = value!;
                });
              },
            ),
            const Text('ชำรุด'),
          ],
        ),
      );
  Widget normalconerRadio() => Container(
        child: const Row(
          children: <Widget>[
            Text(
              'มุมกล้อง',
              style: TextStyle(fontSize: 17),
            ),
          ],
        ),
      );
  Widget damagedconerRadio() => Container(
        child: Row(
          children: <Widget>[
            Radio(
              value: '0',
              groupValue: connerStatus,
              onChanged: (value) {
                setState(() {
                  connerStatus = value!;
                });
              },
            ),
            const Text('ปกติ'),
            Radio(
              value: '1',
              groupValue: connerStatus,
              onChanged: (value) {
                setState(() {
                  connerStatus = value!;
                });
              },
            ),
            const Text('ชำรุด'),
          ],
        ),
      );
  Widget normaldrawbackRadio() => Container(
        child: const Row(
          children: <Widget>[
            Text(
              'สิ่งกีดขวาง',
              style: TextStyle(fontSize: 17),
            ),
          ],
        ),
      );
  Widget damageddrawbackRadio() => Container(
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
  Widget normalsaveRadio() => Container(
        child: const Row(
          children: <Widget>[
            Text(
              'การบันทึก',
              style: TextStyle(fontSize: 17),
            ),
          ],
        ),
      );
  Widget damagedsaveRadio() => Container(
        child: Row(
          children: <Widget>[
            Radio(
              value: '0',
              groupValue: saveStatus,
              onChanged: (value) {
                setState(() {
                  saveStatus = value!;
                });
              },
            ),
            const Text('ปกติ'),
            Radio(
              value: '1',
              groupValue: saveStatus,
              onChanged: (value) {
                setState(() {
                  saveStatus = value!;
                });
              },
            ),
            const Text('ชำรุด'),
          ],
        ),
      );
  Widget normalpowerRadio() => Container(
        child: const Row(
          children: <Widget>[
            Text(
              'การสำรองไฟ',
              style: TextStyle(fontSize: 17),
            ),
          ],
        ),
      );
  Widget damagedpowerRadio() => Container(
        child: Row(
          children: <Widget>[
            Radio(
              value: '0',
              groupValue: powerStatus,
              onChanged: (value) {
                setState(() {
                  powerStatus = value!;
                });
              },
            ),
            const Text('ปกติ'),
            Radio(
              value: '1',
              groupValue: powerStatus,
              onChanged: (value) {
                setState(() {
                  powerStatus = value!;
                });
              },
            ),
            const Text('ชำรุด'),
          ],
        ),
      );

  // dynamic textNum() {
  //   return Container(
  //       child: Text(
  //     'รหัสกล้องวงจรปิด : $_scanBarcode\n',
  //     style: TextStyle(fontSize: 20),
  //   ));
  // }

  Row articleNum(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          width: size * 0.8,
          // child: TextField(onChanged: (value) => articlenum = value.trim(),
          //   decoration: InputDecoration(labelText: '$_scanBarcode'),
          // ),
          child: TextFormField(
            // onChanged: (value) => articlenum = value.trim(),
            // controller: article_numController,
            // initialValue: barcodeScanRes,
            // controller: articleController,
            decoration: InputDecoration(
              labelStyle: MyConstant().h2(),
              labelText: '$_scanBarcode\n',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.primary),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.warning),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Future<Null> editActive() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   String id = preferences.getString('id')!;
  //   // String article_num2 = article_numController.text;
  //   print('######## userid = $id');
  //   print('######## article_num = $_scanBarcode');
  //   String path =
  //       '${MyConstant.domain}/pkoffice/api/getArticle.php?isAdd=true&article_num=$_scanBarcode';
  //   await Dio().get(path).then((value) async {
  //     if (value.toString() == 'null') {
  //       MyDialog()
  //           .normalDialog(context, 'ไม่มีข้อมูล', 'ไม่มีข้อมูลกล้องวงจรปิด');
  //     } else {
  //       for (var items in json.decode(value.data!)) {
  //         ArticleModel model = ArticleModel.fromJson(items);
  //         String getarticlenum = model.articleNum.toString();
  //         print('### ==>>>$getarticlenum');
  //         setState(() {
  //           articleModel.add(model);
  //         });
  //       }
  //     }
  //   });
  // }

  Future<Null> updateActive() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    String id = preferences.getString('id')!;
    // String article_num2 = article_numController.text;
    print('######## userid = $id');
    print('######## Active = $cctvStatus');

    // String path =
    //     '${MyConstant.domain}/pkoffice/api/getArticleinsert.php?isAdd=true&article_num=$_scanBarcode&cctv_user_id=$id&cctv_camera_screen=$cctvStatus&cctv_camera_corner=$connerStatus&cctv_camera_drawback=$drawbackStatus&cctv_camera_save=$saveStatus&cctv_camera_power_backup=$powerStatus';
    // await Dio().get(path).then((value) =>
    //     MyDialog().normalDialog(context, 'บันทึกข้อมูลสำเร็จ', 'สำเร็จ'));

    String url =
        '${MyConstant.domain}/pkoffice/api/getArticleinsert.php?isAdd=true&article_num=$_scanBarcode&cctv_user_id=$id&cctv_camera_screen=$cctvStatus&cctv_camera_corner=$connerStatus&cctv_camera_drawback=$drawbackStatus&cctv_camera_save=$saveStatus&cctv_camera_power_backup=$powerStatus';
    // await Dio().get(path).then((value) async {
    //   String dd = value.toString();
    //   print('######## Vaaaaaaaaaa = $dd');
    //   if (value.toString() == 'true') {
    //     Navigator.pop(context);
    //     // listcctv();
    //     // MyDialog().normalDialog(context, 'บันทึกข้อมูลสำเร็จ', 'สำเร็จ');
    //     // MyDialog().normalDialog(context, 'บันทึกไปแล้ว', 'ข้อมูลซ้ำ');
    //   } else {
    //     MyDialog().normalDialog(context, 'บันทึกไปแล้ว', 'ข้อมูลซ้ำ');
    //     // MyDialog().normalDialog(context, 'บันทึกข้อมูลสำเร็จ', 'สำเร็จ');
    //     // Navigator.pushNamed(context, MyConstant.routeMainCctv);
    //     // Navigator.pop(context);
    //     // Navigator.pushNamed(context, MyConstant.routeMaincctvReq);
    //     // comfirmsaveDialog();
    //   }
    // });
    try {
      Response response = await Dio().get(url);
      print('######## Vresponse = $response');
      if (response.toString() == 'true') {
        Navigator.pop(context);
      } else {
        MyDialog().normalDialog(context, 'บันทึกไปแล้ว', 'ข้อมูลซ้ำ');
      }
    } catch (e) {}
  }

  Future<Null> comfirmsaveDialog() async {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('บันทึกข้อมูลสำเร็จ'),
        children: [
          Center(
            child: OutlinedButton(
              onPressed: () {
                // Navigator.pop(context);
                // Navigator.pushNamed(context, MyConstant.routeMaincctvReq);
                // Navigator.pushNamedAndRemoveUntil(
                //     context, MyConstant.routeMaincctvReq, (route) => false);
              },
              child: const Text('ปิด'),
            ),
          )
        ],
      ),
    );
  }
}
