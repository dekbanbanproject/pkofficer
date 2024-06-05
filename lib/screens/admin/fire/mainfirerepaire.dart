import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pkofficer/models/firelistmodel.dart';
import 'package:pkofficer/screens/admin/fire/firechang.dart';
import 'package:pkofficer/utility/my_constant.dart';
import 'package:pkofficer/widgets/home_app_bar.dart';

class MainFirerepaire extends StatefulWidget {
  const MainFirerepaire({super.key});

  @override
  State<MainFirerepaire> createState() => _MainFirerepaireState();
}

class _MainFirerepaireState extends State<MainFirerepaire> {
  List<FireListmodel> fireModel = [];
  List<FireListmodel> searchfireModel = [];
  final debouncer = Debouncer(millisecond: 500);

  @override
  void initState() {
    super.initState();
    listFire();
  }

  Future<Null> listFire() async {
    if (fireModel.isNotEmpty) {
      fireModel.clear();
    } else {}
    final apifire =
        '${MyConstant.domain}/pkoffice/api/getfirechang.php?isAdd=true';
    await Dio().get(apifire).then((value) async {
      print('## value for API Fire ==>  $value');
      for (var item in json.decode(value.data!)) {
        FireListmodel model = FireListmodel.fromJson(item);
        var fire_num = model.fire_num!.toString();
        print('### ==>>>$fire_num');
        setState(() {
          fireModel.add(model);
          searchfireModel = fireModel;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 1, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
                child: CustomAppBar(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [                
                    Text('รายการที่รอเปลี่ยนถังดับเพลิง', style: MyConstant().h1title()),                
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'รหัสถังดับเพลิง',
                      style: MyConstant().h3header(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'ขนาด(ปอนด์)',
                      style: MyConstant().h3header(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 20),
                    child: Text(
                      'ถังสี',
                      style: MyConstant().h3header(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 20),
                    child: Text(
                      'สถานที่ติดตั้ง',
                      style: MyConstant().h3header(),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 20, right: 20),
                  //   child: Text(
                  //     'ตัวถัง',
                  //     style: MyConstant().h3header(),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 20, right: 20),
                  //   child: Text(
                  //     'เกจความดัน',
                  //     style: MyConstant().h3header(),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 20, right: 20),
                  //   child: Text(
                  //     'สิ่งกีดขวาง',
                  //     style: MyConstant().h3header(),
                  //   ),
                  // ),
                ],
              ),
              
              // Padding(
              //   padding: const EdgeInsets.only(top: 10),
              //   child: buildSearch(),
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: buildListView(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildListView() {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 2),
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: searchfireModel.length,
      itemBuilder: (context, index) => Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            Container(
              child: SlidableAction(
                onPressed: ((context) {
                  MaterialPageRoute route = MaterialPageRoute(
                    builder: (context) => FireChang(
                      fireModelchang: searchfireModel[index],
                    ),
                  );
                  Navigator.push(context, route).then((value) => listFire());
                }),
                backgroundColor: const Color.fromARGB(255, 253, 158, 49),
                icon: Icons.edit_square,
              ),
            ),
            // Container(
            //   child: SlidableAction(
            //     // onPressed: () => deletCheck(searcharticlecheckModel[index].cctv_check_id),
            //     // onPressed: (context) => delectCheck(searchfireModel[index]),
            //     onPressed: (context) {},
            //     backgroundColor: const Color.fromARGB(255, 253, 23, 23),
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
                    ),
                  ],
                ),
                child: Center(
                      child: ListTile(
                        leading:   
                            Text(
                              searchfireModel[index].fire_num!,
                              style: MyConstant().h4dark(),
                            
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                           
                              children: [ 
                                // Text(
                                //   searchfireModel[index].check_date!,
                                //   style: MyConstant().h4dark(),
                                // ),
                                // Padding(
                                //   padding: const EdgeInsets.only(left: 30,right: 40),
                                //   child: Text(
                                //     searchfireModel[index]
                                //         .fire_check_injection_name!,
                                //     style: MyConstant().h4dark(),
                                //   ),
                                // ),
                                // Padding(
                                //   padding: const EdgeInsets.only(left: 30,right: 40),
                                //   child: Text(
                                //     searchfireModel[index]
                                //         .fire_check_joystick_name!,
                                //     style: MyConstant().h4dark(),
                                //   ),
                                // ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 50,right: 50),
                                  child: Text(
                                    searchfireModel[index].fire_size!,
                                    style: MyConstant().h4dark(),
                                  ),
                                ),
                                 Padding(
                                   padding: const EdgeInsets.only(left: 70,right: 20),
                                   child: Text(
                                    searchfireModel[index].fire_color!,
                                    style: MyConstant().h4dark(),
                                                                   ),
                                 ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 30,right: 10),
                                  child: Text(
                                    searchfireModel[index]
                                        .fire_location!,
                                    style: MyConstant().h4dark(),
                                  ),
                                ),
                              ],
                          
                        ),
                        // subtitle: Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     // Text(
                        //     //   searchfireModel[index].fire_num!,
                        //     //   style: MyConstant().h3dark(),
                        //     // ),
                        // Text(
                        //   searchfireModel[index].check_date!,
                        //   style: MyConstant().h3dark(),
                        // ),
                        //     Text(
                        //       searchfireModel[index].fire_check_injection_name!,
                        //       style: MyConstant().h3dark(),
                        //     ),
                        //     Text(
                        //      searchfireModel[index].fire_check_joystick_name!,
                        //       style: MyConstant().h3dark(),
                        //     ),
                        //     Text(
                        //        searchfireModel[index].fire_check_body_name!,
                        //       style: MyConstant().h3dark(),
                        //     ),
                        //     Text(
                        //       searchfireModel[index].fire_check_gauge_name!,
                        //       style: MyConstant().h3dark(),
                        //     ),
                        //     Text(
                        //       searchfireModel[index].fire_check_drawback_name!,
                        //       style: MyConstant().h3dark(),
                        //     ),
                        //   ],
                        // ),
                      ),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
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
