import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pkofficer/models/fdhminidatasetmodel.dart';
import 'package:pkofficer/utility/my_constant.dart';
import 'package:pkofficer/utility/my_dialog.dart';

class MainAuthpidsit extends StatefulWidget {
  const MainAuthpidsit({super.key});

  @override
  State<MainAuthpidsit> createState() => _MainAuthpidsitState();
}

class _MainAuthpidsitState extends State<MainAuthpidsit> {
  // String? vn;
  // String? total_amont;
  // String? pidsit;
  String? vn, total_amont, pidsit, bookid;
  double percent = 0;
  String downloading = 'InitialiZing......';
  bool _isDownloading = false;
  List<Fdhminidatasetmodel> fdhminidatasetModel = [];
  @override
  void initState() {
    super.initState();
    fdh_countvn();
    fdh_sumincome();
    fdh_countpidsit();
    fdh_countbookid();
  }

  Future<void> fdh_sumincome() async {
    final urlincome = MyConstant.fdh_sumincome;
    await Dio().get(urlincome).then((values) async {
      var sumincome_ = values.toString();

      if (values.toString() == '{}') {
        setState(() {
          total_amont = '0';
        });
      } else {
        setState(() {
          total_amont = sumincome_;
        });
      }
      //  for (var item in json.decode(value.data!)) {
      // UsersModel model = UsersModel.fromMap(item);
      print('## value for API  sumincome_==>  $sumincome_');
      // for (var item in json.decode(values.data!)) {
      // Fdhminidatasetmodel model = Fdhminidatasetmodel.fromJson(item);
      // var countvn = model.vn!.toString();
      // print('### ==>>>$countvn');
      // setState(() {
      //   fdhminidatasetModel.add(model);

      // });
      // }
      // setState(() {
      //   total_amont = sumincome_;
      // });
    });
  }

  Future<void> fdh_countvn() async {
    final urlcount = MyConstant.fdh_countvn;
    await Dio().get(urlcount).then((values) async {
      var vn_ = values.toString();
      print('######## pull vn_ = $vn_');
      setState(() {
        vn = vn_;
      });
    });
  }

  Future<void> fdh_countpidsit() async {
    final urlcounts = MyConstant.fdh_countpidsit;
    await Dio().get(urlcounts).then((values) async {
      var vnPidsit = values.toString();
      print('######## pull vn_pidsit = $vnPidsit');
      setState(() {
        pidsit = vnPidsit;
      });
    });
  }

  Future<void> fdh_countbookid() async {
    final urlcountss = MyConstant.fdh_countbookid;
    await Dio().get(urlcountss).then((values) async {
      var vnBookid = values.toString();
      print('######## pull vn_bookid = $vnBookid');
      setState(() {
        bookid = vnBookid;
      });
    });
  }

  Future<void> LoginMini() async {
    try {
      final url = MyConstant.fdh_mini_auth;

      await Dio().get(url).then((values) async {
        String ddd = values.toString();

        print('######## pull LoginMini = $ddd');
        if (values.toString() == '200') {
          MyDialog().normalDialog(context, 'Login Success', 'Success');
        } else {
          MyDialog().normalDialog(context, 'Login Not Success', 'UnSuccess');
        }
      });
      // print('## value for API ===> $status');
    } on PlatformException {}
    if (!mounted) return;
  }

  Future<void> fdh_minipullhosinv() async {
    try {
      final url = MyConstant.fdh_mini_pullhosinv;
      await Dio().get(url).then((values) async {
        String ddd = values.toString();
        print('######## pull fdh_minipullhosinv = $ddd');
        const oneSec = Duration(seconds: 1);
        Timer.periodic(oneSec, (timer) {
          setState(() {
            percent += 0.1;

            if (percent.toStringAsFixed(1) == '1.0') {
              if (_isDownloading = true) {
                _isDownloading = false;
                timer.cancel();
                MyDialog().normalDialog(context, 'Pull Hos Success', 'Success');
                percent = 0;
                setState(() {
                  fdh_countvn();
                  fdh_sumincome();
                  fdh_countpidsit();
                  fdh_countbookid();
                });
              } else {
                MyDialog().normalDialog(context, 'Not Success', 'UnSuccess');
              }
            }
          });
        });
        if (values.toString() == '200') {
          // MyDialog().normalDialog(context, 'Pull Data Success', 'Success');
          // setState(() {
          //   fdh_countvn();
          //   fdh_sumincome();
          //   fdh_countpidsit();
          //   fdh_countbookid();
          // });
        } else {
          MyDialog()
              .normalDialog(context, 'Pull Data Not Success', 'UnSuccess');
        }
      });
      // print('## value for API ===> $status');
    } on PlatformException {}
    if (!mounted) return;
  }

  Future<void> fdh_minipullhosnoinv() async {
    try {
      final urlnoinv = MyConstant.fdh_minipullhosnoinv;

      await Dio().get(urlnoinv).then((values) async {
        String noinv = values.toString();

        print('######## pullfdh_minipullhosnoinv = $noinv');
        const oneSec = Duration(seconds: 1);
        Timer.periodic(oneSec, (timer) {
          setState(() {
            percent += 0.1;
            if (percent.toStringAsFixed(1) == '1.0') {
              if (_isDownloading = true) {
                _isDownloading = false;
                timer.cancel();
                MyDialog().normalDialog(context, 'Pull Hos Success', 'Success');
                percent = 0;
                setState(() {
                  fdh_countvn();
                  fdh_sumincome();
                  fdh_countpidsit();
                  fdh_countbookid();
                });
              } else {
                MyDialog().normalDialog(context, 'Not Success', 'UnSuccess');
              }
            }
          });
        });
        if (values.toString() == '200') {
          // MyDialog().normalDialog(context, 'Pull Data Success', 'Success');
          // setState(() {
          //   fdh_countvn();
          //   fdh_sumincome();
          //   fdh_countpidsit();
          //   fdh_countbookid();
          // });
        } else {
          MyDialog()
              .normalDialog(context, 'Pull Data Not Success', 'UnSuccess');
        }
      });
    } on PlatformException {}
    if (!mounted) return;
  }

  Future<void> fdh_mini_pidsit() async {
    try {
      final urlpidsit = MyConstant.fdh_mini_pidsit;

      await Dio().get(urlpidsit).then((values) async {
        String pidsit = values.toString();

        print('######## pull pidsit = $pidsit');
        const oneSec = Duration(seconds: 1);
        Timer.periodic(oneSec, (timer) {
          setState(() {
            percent += 0.1;
            if (percent.toStringAsFixed(1) == '1.0') {
              if (_isDownloading = true) {
                _isDownloading = false;
                timer.cancel();
                MyDialog()
                    .normalDialog(context, 'ปิดสิทธิ์ Success', 'Success');
                percent = 0;
                setState(() {
                  fdh_countvn();
                  fdh_sumincome();
                  fdh_countpidsit();
                  fdh_countbookid();
                });
              } else {
                MyDialog().normalDialog(context, 'Not Success', 'UnSuccess');
              }
            }
          });
        });
        if (values.toString() == '200') {
          // MyDialog().normalDialog(context, 'ปิดสิทธิ์สำเร็จ', 'Success');
          // setState(() {
          //   fdh_countvn();
          //   fdh_sumincome();
          //   fdh_countpidsit();
          //   fdh_countbookid();
          // });
        } else {
          MyDialog().normalDialog(context, 'ปิดสิทธิ์ไม่สำเร็จ', 'UnSuccess');
        }
      });
    } on PlatformException {}
    if (!mounted) return;
  }

  Future<void> fdh_mini_pullbookid() async {
    try {
      final url = MyConstant.fdh_mini_pullbookid;
      await Dio().get(url).then((values) async {
        String ddd = values.toString();
        print('######## pull bookid = $ddd');
        const oneSec = Duration(seconds: 1);
        Timer.periodic(oneSec, (timer) {
          setState(() {
            percent += 0.1;
            if (percent.toStringAsFixed(1) == '1.0') {
              if (_isDownloading = true) {
                _isDownloading = false;
                timer.cancel();
                MyDialog().normalDialog(context, 'Pull Hos Success', 'Success');
                percent = 0;
                setState(() {
                  fdh_countvn();
                  fdh_sumincome();
                  fdh_countpidsit();
                  fdh_countbookid();
                });
              } else {
                MyDialog().normalDialog(context, 'Not Success', 'UnSuccess');
              }
            }
          });
        });
        if (values.toString() == '200') {
          // MyDialog().normalDialog(context, 'Pull IdBook สำเร็จ', 'Success');
          // setState(() {
          //   fdh_countvn();
          //   fdh_sumincome();
          //   fdh_countpidsit();
          //   fdh_countbookid();
          // });
        } else {
          MyDialog()
              .normalDialog(context, 'Pull IdBook ไม่สำเร็จ', 'UnSuccess');
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Container(
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: Center(
                        child: Text(
                          'Mini Data Set',
                          style: TextStyle(
                            fontSize: 50,
                            fontFamily: 'Kanit-Regular',
                            color: Color.fromARGB(255, 4, 197, 193),
                          ),
                        ),
                        //   child: Container(
                        //     height: 150,
                        //     width: 200,
                        //     decoration: BoxDecoration(
                        //       // shape: BoxShape.circle,
                        //     image: DecorationImage(
                        //         image: AssetImage("images/fdhss.png"),
                        //         fit: BoxFit.cover),
                        //   ),
                        // ),
                      ),
                    ),
                    // SizedBox(height: 5),
                    // Text(
                    //   "FDH",
                    //   style:
                    //       TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    // ),
                  ],
                ),
              ),
              // const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5, right: 10),
                        child: IconButton(
                          style: IconButton.styleFrom(
                              backgroundColor: MyConstant.kprimaryColor,
                              padding: const EdgeInsets.all(10)),
                          iconSize: 90,
                          icon: const Icon(Icons.fingerprint),
                          color: const Color.fromARGB(255, 255, 128, 44),
                          tooltip: 'Login',
                          onPressed: () {
                            setState(() {
                              LoginMini();
                            });
                          },
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 2, right: 2),
                      //   child: IconButton(
                      //     style: IconButton.styleFrom(
                      //         backgroundColor: MyConstant.kprimaryColor,
                      //         padding: const EdgeInsets.all(10)),
                      //     iconSize: 40,
                      //     icon: const Icon(Icons.download),
                      //     // color: Color.fromARGB(255, 44, 149, 235),
                      //     color: const Color.fromARGB(255, 160, 196, 250),
                      //     tooltip: 'Pull Invoice',
                      //     onPressed: () {
                      //       setState(() {
                      //         fdh_minipullhosinv();
                      //       });
                      //     },
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: IconButton(
                          style: IconButton.styleFrom(
                              backgroundColor: MyConstant.kprimaryColor,
                              padding: const EdgeInsets.all(10)),
                          iconSize: 90,
                          icon: const Icon(Icons.download),
                          color: const Color.fromARGB(255, 201, 20, 218),
                          tooltip: 'Pull NoInvoice',
                          onPressed: () {
                            setState(() {
                              fdh_minipullhosnoinv();
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: IconButton(
                          style: IconButton.styleFrom(
                              backgroundColor: MyConstant.kprimaryColor,
                              padding: const EdgeInsets.all(10)),
                          iconSize: 90,
                          icon: const Icon(Icons.upload),
                          color: const Color.fromARGB(255, 252, 64, 111),
                          tooltip: 'Pid Sit',
                          onPressed: () {
                            setState(() {
                              fdh_mini_pidsit();
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: IconButton(
                          style: IconButton.styleFrom(
                              backgroundColor: MyConstant.kprimaryColor,
                              padding: const EdgeInsets.all(10)),
                          iconSize: 90,
                          icon: const Icon(Icons.download),
                          color: const Color.fromARGB(255, 4, 197, 193),
                          tooltip: 'Pull BookID',
                          onPressed: () {
                            setState(() {
                              fdh_mini_pullbookid();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                //   ],
                // ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, top: 2),
                child: Text(downloading ?? ''),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, top: 5),
                child: LinearProgressIndicator(
                  value: percent,
                  minHeight: 15,
                  borderRadius: BorderRadius.circular(30),
                  backgroundColor: const Color.fromARGB(255, 130, 197, 252),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, top: 2),
                child: Text(
                  'Downloading...${(percent * 100).round()} %',
                  style: const TextStyle(
                      fontSize: 30,
                      color: Color.fromARGB(255, 140, 235, 233),
                      fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(
                    left: 50, right: 50, top: 2, bottom: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 320,
                      height: 280,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 82, 176, 253),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(90),
                          bottomLeft: Radius.circular(90),
                        ),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            "images/person.png",
                            height: 200,
                            width: 200,
                          ),
                          Text(
                            'คนไข้ $vn ราย',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 320,
                      height: 280,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 123, 233),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(90),
                          bottomRight: Radius.circular(90),
                        ),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            "images/money.png",
                            height: 200,
                            width: 200,
                          ),
                          Text(
                            '$total_amont ฿',
                            //  '$vn',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 50, right: 50, top: 30, bottom: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 320,
                      height: 280,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 4, 197, 193),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(90),
                          bottomRight: Radius.circular(90),
                        ),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            "images/person.png",
                            height: 200,
                            width: 200,
                          ),
                          Text(
                            'ปิดสิทธิ์ $pidsit ราย',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 320,
                      height: 280,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 253, 169, 100),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(90),
                          bottomLeft: Radius.circular(90),
                        ),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            "images/bookid.png",
                            height: 190,
                            width: 200,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: Text(
                              'BookId $bookid',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      //  appBar: AppBar(
      //   backgroundColor: Colors.blueAccent,
      //   title: Padding(
      //     padding: const EdgeInsets.only(right: 35),
      //     child: Center(
      //       child: Text(
      //         'แก้ไขถังดับเพลิงรหัส 222',
      //         // _gleaveModel.LEAVE_PERSON_FULLNAME,
      // style: TextStyle(
      //     fontSize: 17,
      //     fontFamily: 'Kanit-Regular',
      //     color: Colors.white),
      //       ),
      //     ),
      //   ),
      // ),
      // body: screens[currentIndex],
    );
  }
}
