import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pkofficer/models/article_model.dart';
import 'package:pkofficer/screens/admin/authen/authenspsch.dart';
import 'package:pkofficer/screens/admin/cctv/category.dart';
import 'package:pkofficer/screens/admin/cctv/maincctvreq.dart';
import 'package:pkofficer/screens/admin/electric/mainelectric.dart';
import 'package:pkofficer/screens/admin/fdh/fdhcategory.dart';
import 'package:pkofficer/screens/admin/fire/mainfirereq.dart';
import 'package:pkofficer/screens/admin/phone/mainPhone.dart';
import 'package:pkofficer/screens/admin/plumbing/mainplumbing.dart';
import 'package:pkofficer/screens/admin/prameon.dart';
import 'package:pkofficer/utility/my_constant.dart';
import 'package:pkofficer/widgets/home_app_bar.dart';
import 'package:pkofficer/widgets/search_bar.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  List<ArticleModel> articleModel = [];
  List<ArticleModel> searcharticleModel = [];
  final debouncer = Debouncer(millisecond: 500);
  bool loadStatus = true;
  int currentSlider = 0;
  int selectIndex = 0;
  int index = 0;
  List<String>? menus;
  final List<Widget> screentTab = [
    const MaincctvReq(), // 0
    const Mainfirereq(), // 1
    const MainElectric(), // 2
    const MainPlumbing(), // 3
    const MainPhone(), // 4
    const Authenspsch(), // 5
  ];

  // List<List<Categories>> selectCategories = [];

  @override
  void initState() {
    super.initState();
    listcctv();
  }

  Future<Null> listcctv() async {
    final apicctv = '${MyConstant.domain}/pkoffice/api/article.php?isAdd=true';
    await Dio().get(apicctv).then((value) async {
      // print('## value for API  ==>  $value');
      for (var item in json.decode(value.data!)) {
        ArticleModel model = ArticleModel.fromJson(item);
        var cctvname = model.articleName!.toString();
        print('### ==>>>$cctvname');
        setState(() {
          articleModel.add(model);
          searcharticleModel = articleModel;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15),
              //for custom appbar
              CustomAppBar(),
              //for searchbar
              SizedBox(height: 15),
              MySearchBar(),
              // const SizedBox(height: 15),
              // ImageSlider(
              //   currentSlide: currentSlider,
              //   onChang: (value) {
              //     setState(() {
              //       currentSlider = value;
              //     });
              //   },
              // ),
              SizedBox(height: 30),
              Categories(),
              SizedBox(height: 30),
              FdhCategory(),
              SizedBox(height: 30),
              Pramirn(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget getSelectedWidget({required int index}) {
  Widget widget;
  switch (index) {
    case 0:
      widget = const MaincctvReq();
      break;
    case 1:
      widget = const Mainfirereq();
      break;
    case 2:
      widget = const MainElectric();
      break;
    case 3:
      widget = const MainPlumbing();
      break;
    case 4:
      widget = const MainPhone();
      break;
    case 5:
      widget = const Authenspsch();
      break;
    default:
      widget = const MaincctvReq();
  }
  return widget;
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
// class CustomAppBar extends StatelessWidget {
//   const CustomAppBar({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [

//         IconButton(
//           style: IconButton.styleFrom(
//               backgroundColor: MyConstant.kprimaryColor,
//               padding: const EdgeInsets.all(20)),
//           onPressed: () {},
//           icon: Image.asset(
//             "images/cctv2.jpg",
//             height: 20,
//           ),
//         ),
//         IconButton(
//           style: IconButton.styleFrom(
//               backgroundColor: MyConstant.kprimaryColor,
//               padding: const EdgeInsets.all(20)),
//           onPressed: () {},
//           iconSize: 30,
//           icon: Icon(Icons.notifications_outlined),
//         ),
//       ],
//     );
//   }
// }
