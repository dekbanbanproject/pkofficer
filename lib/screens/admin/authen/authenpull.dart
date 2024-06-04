import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pkofficer/utility/my_constant.dart';
import 'package:pkofficer/utility/my_dialog.dart';

class AuthenPull extends StatefulWidget {
  const AuthenPull({super.key});

  @override
  State<AuthenPull> createState() => _AuthenPullState();
}

class _AuthenPullState extends State<AuthenPull> {
  double percent = 0;
  String downloading = 'InitialiZing......';
  bool _isDownloading = false;
  String? vn,
      total_amont,
      pidsit,
      bookid,
      count_authen,
      count_authen_null,
      total_amont_authen,
      total_amont_noauthen;

  @override
  void initState() {
    super.initState();
    fdh_countvn();
    fdh_sumincome();
    fdh_countauthen();
    fdh_countauthennull();
    fdh_sumincome_authen();
    fdh_sumincome_noauthen();
  }

  Future<void> fdh_countvn() async {
    final urlcount = MyConstant.fdh_countvn;
    await Dio().get(urlcount).then((values) async {
      var vn_ = values.toString();
      print('######## pull vn_ = $vn_');

      if (values.toString() == '{}') {
        setState(() {
          vn = '0';
        });
      } else {
        setState(() {
          vn = vn_;
        });
      }
    });
  }

  Future<void> fdh_countauthen() async {
    final urlcount = MyConstant.fdh_countauthen;
    await Dio().get(urlcount).then((values) async {
      var countauthen = values.toString();
      print('######## pull countauthen = $countauthen');

      if (values.toString() == '') {
        setState(() {
          count_authen = '0';
        });
      } else {
        setState(() {
          count_authen = countauthen;
        });
      }
    });
  }

  Future<void> fdh_countauthennull() async {
    final urlAnull = MyConstant.fdh_countauthennull;
    await Dio().get(urlAnull).then((values) async {
      var countauthennull = values.toString();
      print('######## pull countauthennull = $countauthennull');

      if (values.toString() == '') {
        setState(() {
          count_authen_null = '0';
        });
      } else {
        setState(() {
          count_authen_null = countauthennull;
        });
      }
    });
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
      print('## value for API  sumincome_==>  $sumincome_');
    });
  }

  Future<void> fdh_sumincome_authen() async {
    final urlincome = MyConstant.fdh_sumincome_authen;
    await Dio().get(urlincome).then((values) async {
      var fdhSumincomeauthen = values.toString();

      if (values.toString() == '{}') {
        setState(() {
          total_amont_authen = '0';
        });
      } else {
        setState(() {
          total_amont_authen = fdhSumincomeauthen;
        });
      }
      print('## value for API  fdh_sumincomeauthen==>  $fdhSumincomeauthen');
    });
  }

  Future<void> fdh_sumincome_noauthen() async {
    final urlincome = MyConstant.fdh_sumincome_noauthen;
    await Dio().get(urlincome).then((values) async {
      var fdhSumincomeNoauthen = values.toString();

      if (values.toString() == '{}') {
        setState(() {
          total_amont_noauthen = '0';
        });
      } else {
        setState(() {
          total_amont_noauthen = fdhSumincomeNoauthen;
        });
      }
      print(
          '## value for API  fdh_sumincome_noauthen==>  $fdhSumincomeNoauthen');
    });
  }

  Future<void> Pull_authen() async {
    try {
      String path = MyConstant.authenspsch;
      await Dio().get(path).then((value) async {
        String dd = value.toString();
        print('######## Vaaaaaaaaaa = $dd');
        const oneSec = Duration(seconds: 1);
        Timer.periodic(oneSec, (timer) {
          setState(() {
            percent += 10.0;
            if (percent.toStringAsFixed(1) == '100.0') {
              // _isDownloading = false;
              // timer.cancel();
              // return;
              // MyDialog().normalDialog(context, 'Pull Success', 'Success');
              if (_isDownloading = true) {
                _isDownloading = false;
                timer.cancel();
                MyDialog()
                    .normalDialog(context, 'Pull Authen Success', 'Success');
                percent = 0;
                fdh_countvn();
                fdh_sumincome();
                fdh_countauthen();
                fdh_countauthennull();
                fdh_sumincome_authen();
                fdh_sumincome_noauthen();
              } else {
                MyDialog().normalDialog(context, 'Not Success', 'UnSuccess');
              }
            }
          });
        });
        if (value.toString() == 'true') {
          // MyDialog().normalDialog(context, 'Pull Success', 'Success');
          // Navigator.pop(context, MaincctvReq());
        } else {
          MyDialog().normalDialog(context, 'Not Success', 'UnSuccess');
        }
      });
      print('## value for API ===> ');
    } on PlatformException {}
    if (!mounted) return;
  }

  Future<void> Pull_authen_mini() async {
    try {
      String path = MyConstant.authenspsch_mini;
      await Dio().get(path).then((value) async {
        String dd = value.toString();
        print('######## Vaaa mini = $dd');
        const oneSec = Duration(seconds: 1);
        Timer.periodic(oneSec, (timer) {
          setState(() {
            percent += 10.0;
            if (percent.toStringAsFixed(1) == '100.0') {
              if (_isDownloading = true) {
                _isDownloading = false;
                timer.cancel();
                MyDialog().normalDialog(
                    context, 'Pull Authen Mini Success', 'Success');
                percent = 0;
                fdh_countvn();
                fdh_sumincome();
                fdh_countauthen();
                fdh_countauthennull();
                fdh_sumincome_authen();
                fdh_sumincome_noauthen();
              } else {
                MyDialog().normalDialog(context, 'Not Success', 'UnSuccess');
              }
            }
          });
        });
        if (value.toString() == 'true') {
        } else {
          MyDialog().normalDialog(context, 'Not Success', 'UnSuccess');
        }
      });
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
        const oneSec = Duration(seconds: 1);
        Timer.periodic(oneSec, (timer) {
          setState(() {
            percent += 10.0;
            if (percent.toStringAsFixed(1) == '100.0') {
              // _isDownloading = false;
              // timer.cancel();
              // return;
              // percent = 100.0;
              if (_isDownloading = true) {
                _isDownloading = false;
                timer.cancel();
                MyDialog().normalDialog(context, 'Pull Hos Success', 'Success');
                percent = 0;
                fdh_countvn();
                fdh_sumincome();
                fdh_countauthen();
                fdh_countauthennull();
                fdh_sumincome_authen();
                fdh_sumincome_noauthen();
              } else {
                MyDialog().normalDialog(context, 'Not Success', 'UnSuccess');
              }
            }
          });
        });
        if (values.toString() == '200') {
          // if (percent >= 100) {
          //   setState(() {
          //     percent = 100;
          // MyDialog().normalDialog(context, 'Pull Success', 'Success');
          // });
          // } else {
          //   setState(() {
          //     // Pull_hos();
          //     percent += 20;
          //   });
          // }
          //  MyDialog().normalDialog(context, 'Pull Success', 'Success');
          // Navigator.pop(context, MaincctvReq());
        } else {
          MyDialog().normalDialog(context, 'Not Success', 'UnSuccess');
        }
      });
      // print('## value for API ===> $status');
    } on PlatformException {}
    if (!mounted) return;
  }

  Future<void> Pull_hosmini() async {
    try {
      final url = MyConstant.pullhosminiapi;

      await Dio().get(url).then((values) async {
        String ddd = values.toString();
        print('######## pull HOS Mini = $ddd');
        const oneSec = Duration(seconds: 1);
        Timer.periodic(oneSec, (timer) {
          setState(() {
            percent += 10.0;
            if (percent.toStringAsFixed(1) == '100.0') {
              if (_isDownloading = true) {
                _isDownloading = false;
                timer.cancel();
                MyDialog()
                    .normalDialog(context, 'Pull HOS Mini Success', 'Success');
                percent = 0;
                fdh_countvn();
                fdh_sumincome();
                fdh_countauthen();
                fdh_countauthennull();
                fdh_sumincome_authen();
                fdh_sumincome_noauthen();
              } else {
                MyDialog().normalDialog(context, 'Not Success', 'UnSuccess');
              }
            }
          });
        });
        if (values.toString() == '200') {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(height: 30),
                Container(
                  child: const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Center(
                          child: Text(
                            'Authentication',
                            style: TextStyle(
                              fontSize: 35,
                              fontFamily: 'Kanit-Regular',
                              color: Color.fromARGB(255, 4, 197, 193),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 2, right: 10),
                          child: IconButton(
                            style: IconButton.styleFrom(
                                backgroundColor: MyConstant.kprimaryColor,
                                padding: const EdgeInsets.all(10)),
                            iconSize: 50,
                            icon: const Icon(Icons.download),
                            color: const Color.fromARGB(255, 44, 149, 235),
                            tooltip: 'Pull Authen',
                            onPressed: () {
                              setState(() {
                                _isDownloading = !_isDownloading;
                              });
                              Pull_hos();
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 2, right: 10),
                          child: IconButton(
                            style: IconButton.styleFrom(
                                backgroundColor: MyConstant.kprimaryColor,
                                padding: const EdgeInsets.all(10)),
                            iconSize: 50,
                            icon: const Icon(Icons.download),
                            color: const Color.fromARGB(255, 44, 149, 235),
                            tooltip: 'Pull Authen',
                            onPressed: () {
                              setState(() {
                                _isDownloading = !_isDownloading;
                              });
                              Pull_hosmini();
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 2),
                          child: IconButton(
                            style: IconButton.styleFrom(
                                backgroundColor: MyConstant.kprimaryColor,
                                padding: const EdgeInsets.all(10)),
                            iconSize: 50,
                            icon: const Icon(Icons.download),
                            color: const Color.fromARGB(255, 201, 20, 218),
                            tooltip: 'Pull NoInvoice',
                            onPressed: () {
                              setState(() {
                                Pull_authen();
                                // fdh_minipullhosnoinv();
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 2),
                          child: IconButton(
                            style: IconButton.styleFrom(
                                backgroundColor: MyConstant.kprimaryColor,
                                padding: const EdgeInsets.all(10)),
                            iconSize: 50,
                            icon: const Icon(Icons.download),
                            color: const Color.fromARGB(255, 5, 161, 167),
                            tooltip: 'Pull NoInvoice',
                            onPressed: () {
                              setState(() {
                                Pull_authen_mini();
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
                const SizedBox(height: 2),
                CircularPercentIndicator(
                  radius: 80,
                  percent: percent / 100,
                  animation: true,
                  lineWidth: 15,
                  animateFromLastPercent: true,
                  center: Text("${percent.toStringAsFixed(1)}%"),
                  progressColor: Colors.pinkAccent,
                ),
                SizedBox(
                  height: 160,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 5, right: 5, top: 5, bottom: 5),
                        child: Container(
                          width: 170,
                          height: 160,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 82, 176, 253),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50),
                              bottomLeft: Radius.circular(50),
                              topLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50),
                            ),
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                "images/person.png",
                                height: 110,
                                width: 110,
                              ),
                              Text(
                                'คนไข้ $vn ราย',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 5, right: 5, top: 5, bottom: 5),
                        child: Container(
                          width: 170,
                          height: 160,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 3, 185, 185),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50),
                              bottomLeft: Radius.circular(50),
                              topLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50),
                            ),
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                "images/person.png",
                                height: 110,
                                width: 110,
                              ),
                              Text(
                                'Authen $count_authen ราย',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 5, right: 5, top: 5, bottom: 5),
                        child: Container(
                          width: 170,
                          height: 160,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 255, 123, 233),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50),
                              bottomLeft: Radius.circular(50),
                              topLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50),
                            ),
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                "images/person.png",
                                height: 110,
                                width: 110,
                              ),
                              Text(
                                'ไม่ Authen $count_authen_null ราย',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 160,
                  // padding: const EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 5, right: 5, top: 5, bottom: 5),
                        child: Container(
                          width: 170,
                          height: 160,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 146, 203, 250),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50),
                              topRight: Radius.circular(50),
                              bottomLeft: Radius.circular(50),
                            ),
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                "images/money.png",
                                height: 110,
                                width: 110,
                              ),
                              Text(
                                '$total_amont ฿',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 5, right: 5, top: 5, bottom: 5),
                        child: Container(
                          width: 170,
                          height: 160,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 62, 233, 233),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50),
                              topRight: Radius.circular(50),
                              bottomLeft: Radius.circular(50),
                            ),
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                "images/money.png",
                                height: 110,
                                width: 110,
                              ),
                              Text(
                                '$total_amont_authen ฿',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 5, right: 5, top: 5, bottom: 5),
                        child: Container(
                          width: 170,
                          height: 160,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 248, 156, 233),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50),
                              topRight: Radius.circular(50),
                              bottomLeft: Radius.circular(50),
                            ),
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                "images/money.png",
                                height: 110,
                                width: 110,
                              ),
                              Text(
                                '$total_amont_noauthen ฿',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
