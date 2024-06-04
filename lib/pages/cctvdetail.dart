import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pkofficer/models/article_model.dart';
import 'package:pkofficer/utility/my_constant.dart';

class CctvDetail extends StatefulWidget {
  // final ArticleModel article;
  // const CctvDetail({super.key});
  // const CctvDetail(String article_num, {Key? key, required this.article}) : super(key: key);

  // final String articlenum;
  final ArticleModel article_num;
  const CctvDetail(this.article_num, {super.key});
  // const CctvDetail(String article_num, {Key? key, required this.article_num}) : super(key: key);

  // const CctvDetail(String article_num, {Key? key, required this.article_num}) : super(key: key);

  @override
  State<CctvDetail> createState() => _CctvDetailState();
}

class _CctvDetailState extends State<CctvDetail> {
  late ArticleModel article_num;
//   late ArticleModel article;
//   // String? articlenum;
// List<ArticleModel> articleList = [];
  List<ArticleModel> articleModel = [];
  List<ArticleModel> searcharticleModel = [];
  String? arti;
  // set articlenum(String? articlenum) {}
//     //  String? articleName;
  @override
  void initState() {
    article_num = widget.article_num;
    arti = article_num.articleNum;
    super.initState();
    // getArticle();
    listcctv();
  }

  Future<Null> listcctv() async {
    final apicctv =
        '${MyConstant.domain}/pkoffice/api/getArticle.php?isAdd=true&article_num=${widget.article_num}';
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

  // Future<Null> getArticle() async {
  // String? articlenum = article.articleNum;
  // print(articlenum);
  // String url =
  //  final url =
  // await http.get(Uri.parse(
  // '${MyConstant.domain}/pkoffice/api/getArticle.php?isAdd=true&article_num=${widget.articlenum}'));
  // .then(
  // (response) {
  //   if (jsonDecode(response.body) != null) {
  //     setState(() {
  //       article = ArticleModel.fromJson(jsonDecode(response.body));
  //       print(article);
  //     });
  //     return article;
  //   }
  // },
  // );
// var data = jsonDecode(response.body.toString());
  // await Dio().get(url).then((response) {
  //   if (response.toString() == 'true') {
  //     // print(value);
  //      print('### ==>>>$response');
  //      if (response.statusCode ==200) {
  //        for (var map in collection) {

  //        }
  //      } else {

  //      }
  //     // Navigator.pop(context);
  //     // readdatagleave();
  //   } else {
  //     Navigator.pop(context);
  //   }
  // });
  //  final response = await http.get(Uri.parse(
  // 'http://smarthos-phukieohos.moph.go.th/pkoffice/api/article.php?isAdd=true'));
  // var data = jsonDecode(response.body.toString());
  //  if (response.statusCode == 200) {
  //   for (Map i in data) {
  //     // print(i['cctv_location']);
  //     article.add(ArticleModel.fromJson(data));
  //   }
  //   return article;
  // } else {
  //   return articleList;
  // }
  // var url = 'http://smarthos-phukieohos.moph.go.th/pkoffice/api/article.php?article_num=${widget.articlenum}';
  // final response = await http.get(Uri.parse(
  //     'http://smarthos-phukieohos.moph.go.th/pkoffice/api/article.php?isAdd=true&article_num=${widget.articlenum}'));
  // var data = jsonDecode(response.body.toString());
  // // print(data);
  // if (response.statusCode == 200) {
  //   for (Map i in data) {
  //     // print(i['cctv_location']);
  //     article.add(ArticleModel.fromJson(data));
  //     print(article);
  //   }
  //   return article;
  // } else {
  //   return article;
  // }
  //  await http.get("http://smarthos-phukieohos.moph.go.th/pkoffice/api/article.php?article_num")
  // await http.get(url as Uri)
  //     .then(
  // (response) {
  //   if (jsonDecode(response.body) != null) {
  //     setState(() {
  //       article = ArticleModel.fromJson(jsonDecode(response.body));
  //       //  print(article);
  //     });
  //     // return article;
  //   }
  // },
  // );
  // }

  @override
  Widget build(BuildContext context) {
    // var articleName;

    return Expanded(
      child: articleModel.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(arti!),
                  ),
                ],
              ),
            ),
    );
    //  return Padding(
    //   padding: const EdgeInsets.all(24.0),
    //   child: Column(
    //     children: [
    //       Text('Profile Page'),
    //       Center(child: SizedBox(height: 150,)),
    //                     Text("data,${article.articleNum}",
    //                   style: TextStyle(fontSize: 20)),
    //     ],
    //   ),
    // );
    // return Scaffold(
    // body: Text("data,${widget.articlenum}"),
    // body: article == null
    //     ? Text(
    //         "data,${widget.articlenum}",
    //         style: TextStyle(fontSize: 20),
    //       )
    //     : Container(
    //         child: Column(
    //           children: <Widget>[
    //             Text("data,${article.articleNum}",
    //                 style: TextStyle(fontSize: 20)),
    //             Text("data,${article.articleName}",
    //                 style: TextStyle(fontSize: 20)),
    //             Text("data,${article.cctvCode}",
    //                 style: TextStyle(fontSize: 20)),
    //             Text("data,${article.cctvType}",
    //                 style: TextStyle(fontSize: 20)),
    //             Text("data,${article.cctvMonitor}",
    //                 style: TextStyle(fontSize: 20)),
    //           ],
    //         ),
    //       ),
    // );
  }
}
