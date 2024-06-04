import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pkofficer/models/article_model.dart';
import 'package:pkofficer/utility/my_constant.dart';

class MySearchBar extends StatefulWidget {
  const MySearchBar({super.key});

  @override
  State<MySearchBar> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  List<ArticleModel> articleModel = [];
  List<ArticleModel> searcharticleModel = [];

  @override
  void initState() {
    super.initState();
    // readdatacctv();
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
    final debouncer = Debouncer(millisecond: 500);

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
                    searcharticleModel = articleModel
                        .where((element) => element.cctvCode!
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
          Container(height: 25, width: 1.5, color: Colors.grey),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.tune,
              color: Colors.grey,
            ),
          ),
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
