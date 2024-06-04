import 'package:flutter/material.dart';
import 'package:pkofficer/models/article_model.dart';

class CameraCCtv extends StatefulWidget {
  const CameraCCtv({super.key});

  @override
  State<CameraCCtv> createState() => _CameraCtState();
}

class _CameraCtState extends State<CameraCCtv> {
  List<ArticleModel> articlemodels = [];
  List<ArticleModel> searcharticlemodels = [];
  bool loadStatus = true;

  @override
  void initState() {
    super.initState();
  }

  Future<Null> readarticlecctv() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 232, 240),
      appBar: AppBar(
        title: const Text('ลงข้อมูลกล้องวงจรปิด'),
        // elevation: 0,
        // backgroundColor: Colors.white,
        // leading: Builder(
        //   builder: (context) {
        //     return IconButton(
        //       onPressed: () => Scaffold.of(context).openDrawer(),
        //       icon: Icon(
        //         Icons.menu_open,
        //         color: Colors.orange,
        //       ),
        //     );
        //   },
        // ),
        // title: Row(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   children: [MyConstant().version],
        // ),
      ),
      // drawer: Drawer(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.end,
      //   ),
      // ),
      // body: SafeArea(child: Container()),
    );
  }
}
