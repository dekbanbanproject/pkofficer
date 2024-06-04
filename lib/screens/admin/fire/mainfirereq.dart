import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pkofficer/models/firemodel.dart';
import 'package:pkofficer/screens/admin/fire/mainfireadd.dart';
import 'package:pkofficer/screens/admin/fire/mainfireedit.dart';
import 'package:pkofficer/utility/my_constant.dart';

class Mainfirereq extends StatefulWidget {
  const Mainfirereq({super.key});

  @override
  State<Mainfirereq> createState() => _MainfirereqState();
}

class _MainfirereqState extends State<Mainfirereq> {
  List<Firemodel> fireModel = [];
  List<Firemodel> searchfireModel = [];
  final debouncer = Debouncer(millisecond: 500);
  bool loadStatus = true;

  @override
  void initState() {
    super.initState();
    listFire();
  }

  Future<Null> listFire() async {
    if (fireModel.isNotEmpty) {
      fireModel.clear();
    } else {}
    final apifire = '${MyConstant.domain}/pkoffice/api/getfire.php?isAdd=true';
    await Dio().get(apifire).then((value) async {
      print('## value for API  ==>  $value');
      for (var item in json.decode(value.data!)) {
        Firemodel model = Firemodel.fromJson(item);
        var firename = model.fire_num!.toString();
        print('### ==>>>$firename');
        setState(() {
          fireModel.add(model);
          searchfireModel = fireModel;
        });
      }
    });
  }

  @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  Widget build(BuildContext context) => DefaultTabController(
        length: 5,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverAppBar(
                toolbarHeight: 10,
                pinned: true,
                floating: true,
                snap: true,
                // title: Text('บันทึกข้อมูลถังดับเพลิง', style: MyConstant().h4back()),
                forceElevated: innerBoxIsScrolled,
                centerTitle: true,
                automaticallyImplyLeading: false,
                bottom: TabBar(
                    indicatorColor: Colors.white,
                    indicatorWeight: 3,
                    tabs: [
                      // Tab(
                      //     icon: Icon(Icons.qr_code_scanner_rounded,
                      //         color: Color.fromARGB(255, 255, 64, 121)),
                      //     text: 'Scan Detail'),
                      Tab(
                          icon: Icon(Icons.fire_hydrant,
                              color: Color.fromARGB(255, 6, 189, 158)),
                          text: 'Fire List'),
                      // Text('รายการถังดับเพลิง', style: MyConstant().h4back()),
                      Tab(
                          icon: Icon(Icons.qr_code_scanner_rounded,
                              color: Colors.lightBlueAccent),
                          text: 'Scan Add'),
                    ]),
              )
            ],
            body: TabBarView(children: [
              // Center(
              //   child: Text('Detail'),
              // ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: buildSearch(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: buildListView(),
                    ),
                  ],
                ),
              ),
              MainFireadd()
            ]),
            // body: SingleChildScrollView(
            //   child: Padding(
            //     padding: const EdgeInsets.only(top: 1,left: 10,right: 10),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         const SizedBox(height: 15),
            //         // Row(
            //         //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         //   children: [
            //         //     IconButton(
            //         //       style: IconButton.styleFrom(
            //         //           backgroundColor: MyConstant.kprimaryColor,
            //         //           padding: const EdgeInsets.all(20)),
            //         //       onPressed: () => Navigator.push(
            //         //         context,
            //         //         MaterialPageRoute(
            //         //           builder: (context) => const MainfireDetail(),
            //         //         ),
            //         //       ),
            //         //       iconSize: 30,
            //         //       icon: const Icon(Icons.qr_code_scanner_rounded,
            //         //           color: Color.fromARGB(255, 255, 64, 121)),
            //         //     ),
            //         //     Text('บันทึกข้อมูลถังดับเพลิง', style: MyConstant().h4back()),
            //         //     IconButton(
            //         //       style: IconButton.styleFrom(
            //         //           backgroundColor: MyConstant.kprimaryColor,
            //         //           padding: const EdgeInsets.all(20)),
            //         //       onPressed: () => Navigator.push(
            //         //           context,
            //         //           MaterialPageRoute(
            //         //             builder: (context) => const MainFireadd(),
            //         //           )).then((value) => listFire()),
            //         //       iconSize: 30,
            //         //       icon: const Icon(Icons.qr_code_scanner_rounded,
            //         //           color: Colors.lightBlueAccent),
            //         //     ),
            //         //   ],
            //         // ),
            //         Padding(
            //           padding: const EdgeInsets.only(top: 10),
            //           child: buildSearch(),
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.only(top: 10),
            //           child: buildListView(),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ),
        ),
      );
  // }

  Container buildSearch() {
    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
        color: MyConstant.searchColor,
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: Row(
        children: [
          const Icon(
            Icons.search,
            color: Colors.grey,
            size: 30,
          ),
          const SizedBox(
            width: 10,
          ),
          Flexible(
            flex: 4,
            child: TextField(
              onChanged: (value) {
                debouncer.run(() {
                  setState(() {
                    searchfireModel = fireModel
                        .where((element) => element.fire_num!
                            .toLowerCase()
                            .contains(value.toLowerCase()))
                        .toList();
                  });
                });
              },
              decoration: const InputDecoration(
                  hintText: "Search....", border: InputBorder.none),
            ),
          ),
        ],
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
                    builder: (context) => MainFireedit(
                      fireModeledit: searchfireModel[index],
                    ),
                  );
                  Navigator.push(context, route).then((value) => listFire());
                }),
                backgroundColor: const Color.fromARGB(255, 253, 158, 49),
                icon: Icons.edit_rounded,
              ),
            ),
            Container(
              child: SlidableAction(
                // onPressed: () => deletCheck(searcharticlecheckModel[index].cctv_check_id),
                onPressed: (context) => delectCheck(searchfireModel[index]),
                backgroundColor: const Color.fromARGB(255, 253, 23, 23),
                icon: Icons.delete,
              ),
            ),
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
                          searchfireModel[index].check_date!,
                          style: MyConstant().h5dark(),
                        ),
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

  Future<Null> delectCheck(Firemodel searchfireModel) async {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: Text('ต้องการลบข้อมูล ${searchfireModel.fire_num} ใช่ไหม ?'),
        children: [
          // Center(
          //   child: OutlinedButton(
          // onPressed: () async {
          //   Navigator.pop(context);
          //   String path =
          //       '${MyConstant.domain}/pkoffice/api/deletefire.php?isAdd=true&fire_num=${searchfireModel.fire_num}&check_date=${searchfireModel.check_date}';
          //   await Dio().get(path).then((value) => listFire());
          // },
          //     child: Text('ใช่ ต้องการลบข้อมูล'),
          //   ),
          // )
          Center(
            child: ElevatedButton.icon(
              label: Text(
                ' Yes',
                style: MyConstant().h2White(),
              ),
              onPressed: () async {
                Navigator.pop(context);
                String path =
                    '${MyConstant.domain}/pkoffice/api/deletefire.php?isAdd=true&fire_num=${searchfireModel.fire_num}&check_date=${searchfireModel.check_date}';
                await Dio().get(path).then((value) => listFire());
              },
              // onPressed: () => comfirmDialog(),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  backgroundColor: const Color.fromARGB(255, 255, 80, 103)),
            ),
          )
        ],
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
