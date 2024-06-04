import 'package:flutter/material.dart';
import 'package:pkofficer/models/article_model.dart';
import 'package:pkofficer/utility/my_constant.dart';

class CctvList extends StatelessWidget {
  final ArticleModel articleModel;
  const CctvList({super.key, required this.articleModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: MyConstant.kprimaryColor),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 0, right: 0, top: 3, bottom: 3),
                  child: Container(
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: const Border(
                        top: BorderSide(
                            color: Color.fromARGB(255, 102, 217, 252)),
                        left: BorderSide(
                            color: Color.fromARGB(255, 102, 217, 252)),
                        right: BorderSide(
                            color: Color.fromARGB(255, 102, 217, 252)),
                        bottom: BorderSide(
                            color: Color.fromARGB(255, 102, 217, 252)),
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
                        leading: Text(
                          articleModel.articleNum!,
                          style: MyConstant().h5dark(),
                        ),
                        title: Text(
                          articleModel.cctvType!,
                          style: MyConstant().h5dark(),
                        ),
                        trailing: Text(
                          articleModel.articleName!,
                          style: MyConstant().h5dark(),
                        ),
                      ),
                    ),
                  ),
                ),
                // SizedBox(height: 15),
                // Center(
                //   child: Padding(
                //     padding: const EdgeInsets.only(left: 10, right: 10),
                //     child: Image.asset(
                //       "images/cctv2.png",
                //       // width: 130,
                //       // height: 100,
                //       fit: BoxFit.cover,
                //     ),
                //   ),
                // ),
                // SizedBox(height: 10),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     Padding(
                //       padding: EdgeInsets.only(left: 10),
                //       child: Text(
                //         articleModel.articleNum!,
                //         style: TextStyle(
                //             fontWeight: FontWeight.bold, fontSize: 14),
                //       ),
                //     ),
                //     Padding(
                //       padding: EdgeInsets.only(left: 2),
                //       child: Text(
                //         articleModel.cctvType!,
                //         style: TextStyle(
                //             fontWeight: FontWeight.bold, fontSize: 14),
                //       ),
                //     ),
                //     Row(
                //       children: [
                //         Padding(
                //           padding: EdgeInsets.only(right: 5),
                //           child: Text(
                //             articleModel.articleName!,
                //             style: TextStyle(
                //                 fontWeight: FontWeight.bold, fontSize: 14),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ],
                // ),
                // SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
