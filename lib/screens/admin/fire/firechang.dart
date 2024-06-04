import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pkofficer/models/firelistmodel.dart';
import 'package:http/http.dart' as http;
import 'package:pkofficer/screens/admin/fire/mainfirerepaire.dart';
import 'package:pkofficer/utility/my_constant.dart';
import 'package:pkofficer/utility/my_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FireChang extends StatefulWidget {
  final FireListmodel fireModelchang;
  const FireChang({super.key, required this.fireModelchang});
  // const FireChang({super.key});

  @override
  State<FireChang> createState() => _FireChangState();
}

class _FireChangState extends State<FireChang> {
  final formKey = GlobalKey<FormState>();
  late FireListmodel _fireModelchang;
  String? fire_id, fire_num, fire_name, fire_size, fire_color, fire_location;
  List<FireListmodel> fireModel = [];
  TextEditingController changController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fireModelchang = widget.fireModelchang;
    fire_id = _fireModelchang.fire_id;
    fire_num = _fireModelchang.fire_num;
    fire_name = _fireModelchang.fire_name;
    fire_size = _fireModelchang.fire_size;
    fire_color = _fireModelchang.fire_color;
    fire_location = _fireModelchang.fire_location;

    // getfire();
  }

  Future<List<FireListmodel>> getfire() async {
    try {
      final response = await http.get(Uri.parse(
          '${MyConstant.domain}/pkoffice/api/getfiredropdown.php?isAdd=true'));
      final body = json.decode(response.body) as List;
      if (response.statusCode == 200) {
        return body.map((e) {
          final map = e as Map<String, dynamic>;
          return FireListmodel(
              fire_id: map['fire_id'],
              fire_num: map['fire_num'],
              fire_name: map['fire_name']);
        }).toList();
      }
    } on SocketException {
      throw Exception('Failed Network Connect Error');
    }
    throw Exception('Failed to get Data error.');
  }

  var selectedValue;

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 27, 207, 180),
        title: Padding(
          padding: const EdgeInsets.only(right: 35),
          child: Center(
            child: Text(
              'เปลี่ยนถังดับเพลิงรหัส $fire_num',
              // _gleaveModel.LEAVE_PERSON_FULLNAME,
              style: const TextStyle(
                  fontSize: 17,
                  fontFamily: 'Kanit-Regular',
                  color: Colors.white),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          behavior: HitTestBehavior.opaque,
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20, left: 30, right: 20, bottom: 5),
                  child: Text(
                    'รายการถังสำรองทั้งหมด',
                    style: MyConstant().h2title(),
                  ),
                ),
                buildFireCode(size),
                buildComment(size),
                updateButtom(size),
              ],
            ),
          ),
        ),
      ),
      // body: Padding(
      //   padding: const EdgeInsets.all(15.0),
      //   child: Column(
      //     children: [
      // Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: FutureBuilder<List<FireListmodel>>(
      //     future: getfire(),
      //     builder: (context, snapshot) {
      //       if (snapshot.hasData) {
      //         return DropdownButton(
      //           value: selectedValue,
      //           dropdownColor: Colors.white,
      //           isExpanded: true,
      //           hint: const Text('Select Fire Chang Item'),
      //           items: snapshot.data!.map((e) {
      //             return DropdownMenuItem(
      //               value: e.fire_id.toString(),
      //               child: Container(
      //                 child: Row(
      //                   mainAxisAlignment: MainAxisAlignment.center,
      //                   children: [
      //                     Text('รหัส : ${e.fire_num.toString()}'),
      //                     Text('  --  '),
      //                     Text(e.fire_name.toString()),
      //                   ],
      //                 ),
      //               ),
      //             );
      //           }).toList(),
      //           onChanged: (value) {
      //             setState(() {
      //               selectedValue = value;
      //             });
      //           },
      //         );
      //       } else if (snapshot.hasError) {
      //         return Text('error:${snapshot.error}');
      //       } else {
      //         return const CircularProgressIndicator();
      //       }
      //     },
      //   ),
      // ),
      //       // Text('error:'),
      // Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: TextFormField(
      //     controller: changController,
      //     validator: (value) {
      //       if (value!.isEmpty) {
      //         return 'กรุณากรอก หมายเหตุ';
      //       } else {
      //         return null;
      //       }
      //     },
      //     decoration: InputDecoration(
      //       labelStyle: MyConstant().h2(),
      //       labelText: 'หมายเหตุ ',
      //       prefixIcon: const Icon(
      //         Icons.sync,
      //         color: Color.fromARGB(255, 27, 207, 180),
      //       ),
      //       enabledBorder: OutlineInputBorder(
      //         borderSide: const BorderSide(
      //             color: Color.fromARGB(255, 27, 207, 180)),
      //         borderRadius: BorderRadius.circular(30),
      //       ),
      //       focusedBorder: OutlineInputBorder(
      //         borderSide: BorderSide(color: MyConstant.warning),
      //         borderRadius: BorderRadius.circular(20),
      //       ),
      //     ),
      //   ),
      // ),
      //        updateButtom(size),
      //     ],
      //   ),
      // ),
    );
  }

  Row buildFireCode(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 17),
          width: size * 0.9,
          child: FutureBuilder<List<FireListmodel>>(
            future: getfire(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return DropdownButton(
                  value: selectedValue,
                  dropdownColor: Colors.white,
                  isExpanded: true,
                  hint: const Text('Select Fire Chang Item'),
                  items: snapshot.data!.map((e) {
                    return DropdownMenuItem(
                      value: e.fire_id.toString(),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('รหัส : ${e.fire_num.toString()}'),
                            Text('  --  '),
                            Text(e.fire_name.toString()),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                );
              } else if (snapshot.hasError) {
                return Text('error:${snapshot.error}');
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ],
    );
  }

  Row buildComment(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          width: size * 0.9,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: changController,
              maxLines: 5,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'กรุณากรอกหมายเหตุ';
                } else {
                  return null;
                }
                
              },
              decoration: InputDecoration(
                labelStyle: MyConstant().h2(),
                labelText: 'กรุณากรอกหมายเหตุ ',
                prefixIcon: const Icon(
                  Icons.sync,
                  color: Color.fromARGB(255, 27, 207, 180),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 27, 207, 180)),
                  borderRadius: BorderRadius.circular(30),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyConstant.warning),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row updateButtom(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 18),
          width: size * 0.6,
          child: Padding(
            padding: const EdgeInsets.only(top: 3),
            child: ElevatedButton.icon(
              icon: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(
                  Icons.save_as,
                  color: Color.fromARGB(255, 8, 190, 166),
                  size: 30.0,
                ),
              ),
              label: Text(
                'Update',
                style: MyConstant().h2save(),
              ),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  String comment = changController.text;
                  print('## comment = $comment');
                  comfirmDialog();
                }
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  backgroundColor: const Color.fromARGB(255, 222, 248, 244)),
            ),
          ),
        ),
      ],
    );
  }

  Future<Null> comfirmDialog() async {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('บันทึกข้อมูลใช่ไหม ?'),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: ElevatedButton.icon(
                  label: Text(
                    ' Yes',
                    style: MyConstant().h2save(),
                  ),
                  onPressed: () {
                    if (selectedValue.isEmpty || changController.text.isEmpty) {
                      MyDialog().normalDialog(
                          context, 'ยังไม่ได้ใส่ข้อมูล', 'ข้อมูลว่าง');
                      //  return
                      // Navigator.pop(context);
                    } else {
                      // Navigator.pop(context);
                      saveFirechange();
                    }
                  },
                  // onPressed: () => comfirmDialog(),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      backgroundColor:
                          const Color.fromARGB(255, 222, 248, 244)),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<Null> saveFirechange() async {
    SharedPreferences preferences = await SharedPreferences.getInstance(); 
    String id = preferences.getString('id')!;
    String comment = changController.text;
    String path =
        '${MyConstant.domain}/pkoffice/api/fireChangedinsert.php?isAdd=true&fire_id=$fire_id&fire_num=$fire_num&fire_num_chang=$selectedValue&userid=$id&fire_chang_comment=$comment';
    await Dio().get(path).then((value) async {
      String dd = value.toString();
      print('######## Vaaaaaaaaaa = $dd');
      if (value.toString() == 'false') {
        MyDialog().normalDialog(context, 'บันทึกไปแล้ว', 'ข้อมูลซ้ำ');
      } else {
        SuccessDialog();
        
      }
    });
  }

  Future<Null> SuccessDialog() async {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('บันทึกข้อมูลสำเร็จ'),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: ElevatedButton.icon(
                  label: Text(
                    ' Close',
                    style: MyConstant().h2save(),
                  ),
                  onPressed: () {
                    final route =
                        MaterialPageRoute(builder: (context) => MainFirerepaire());
                 
                    Navigator.pushAndRemoveUntil(
                        context, route, (route) => false); 
                    setState(() {
                      selectedValue = '';
                      changController.text = ''; 
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      backgroundColor:
                          const Color.fromARGB(255, 222, 248, 244)),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
