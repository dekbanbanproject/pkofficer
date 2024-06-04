import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pkofficer/models/article_model_check.dart';
import 'package:pkofficer/screens/admin/cctv/maincctv.dart';
import 'package:pkofficer/screens/admin/cctv/maincctvadd.dart';
import 'package:pkofficer/screens/admin/cctv/maincctvreq.dart';
import 'package:pkofficer/utility/my_constant.dart';

class MainFire extends StatefulWidget {
  const MainFire({super.key});

  @override
  State<MainFire> createState() => _MainFireState();
}

class _MainFireState extends State<MainFire> {
  List screens = const [
    MainCctv(), // 0
    MainCctvAdd() // 1
  ];
  int currentSlider = 0;
  List<ArticleCheckModel> articlecheckModel = [];
  List<ArticleCheckModel> searcharticlecheckModel = [];
  final debouncer = Debouncer(millisecond: 500);
  bool loadStatus = true;

  @override
  void initState() {
    super.initState();
    // readdatacctv();
    listcctv();
  }

  Future<Null> listcctv() async {
    final apicctv =
        '${MyConstant.domain}/pkoffice/api/getcctv_lastsave.php?isAdd=true';
    await Dio().get(apicctv).then((value) async {
      print('## value for API  ==>  $value');
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // body: screens[currentIndex],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    style: IconButton.styleFrom(
                        backgroundColor: MyConstant.kprimaryColor,
                        padding: const EdgeInsets.all(20)),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MaincctvReq(),
                      ),
                    ),
                    iconSize: 30,
                    icon: const Icon(Icons.photo_camera_front,
                        color: Colors.lightBlueAccent),
                  ),
                  IconButton(
                    style: IconButton.styleFrom(
                        backgroundColor: MyConstant.kprimaryColor,
                        padding: const EdgeInsets.all(20)),
                    onPressed: () {},
                    iconSize: 30,
                    icon: const Icon(Icons.photo_camera_back,
                        color: Colors.lightBlueAccent),
                  ),
                  IconButton(
                    style: IconButton.styleFrom(
                        backgroundColor: MyConstant.kprimaryColor,
                        padding: const EdgeInsets.all(20)),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainCctvAdd(),
                      ),
                    ),
                    iconSize: 30,
                    icon: const Icon(Icons.qr_code_scanner_rounded,
                        color: Colors.lightBlueAccent),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: buildSearch(),
              ),
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
                    searcharticlecheckModel = articlecheckModel
                        .where((element) => element.articleNum!
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

  ListView buildListView() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: searcharticlecheckModel.length,
      itemBuilder: (context, index) => GestureDetector(
        child: Padding(
          padding: const EdgeInsets.only(left: 0, right: 0, top: 3, bottom: 3),
          child: Container(
            height: 55,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 2),
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: Card(
              elevation: 1,
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
                      searcharticlecheckModel[index].cctv_camera_corner!,
                      style: MyConstant().h5dark(),
                    ),
                    Text(
                      searcharticlecheckModel[index].cctv_camera_drawback!,
                      style: MyConstant().h5dark(),
                    ),
                    Text(
                      searcharticlecheckModel[index].cctv_camera_power_backup!,
                      style: MyConstant().h5dark(),
                    ),
                    Text(
                      searcharticlecheckModel[index].cctv_camera_save!,
                      style: MyConstant().h5dark(),
                    ),
                    Text(
                      searcharticlecheckModel[index].cctv_camera_screen!,
                      style: MyConstant().h5dark(),
                    ),
                  ],
                ),
              ),
            ),
          ),
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
