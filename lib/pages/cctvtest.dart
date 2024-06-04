import 'package:flutter/material.dart';
import 'package:pkofficer/models/article_model.dart';

class Detail extends StatefulWidget {
  // const Detail({super.key});
  final String code;
  const Detail(this.code, {super.key});
  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  late ArticleModel article;

  // Future<ArticleModel> getArticle() async {
  //   await http
  //       .get(
  //           "http://smarthos-phukieohos.moph.go.th/pkoffice/api/getArticle.php?isAdd=true&article_num=${widget.code}")
  //       .then(
  //     (response) {
  //       if (jsonDecode(response.body) != null) {}
  //     },
  //   );
  // }

  @override
  void initState() {
    // getArticle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
