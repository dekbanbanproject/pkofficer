import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pkofficer/models/usersModel.dart';
import 'package:pkofficer/utility/my_constant.dart';
import 'package:pkofficer/utility/my_dialog.dart';
import 'package:pkofficer/widgets/home_app_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainProfile extends StatefulWidget {
  const MainProfile({super.key});

  @override
  State<MainProfile> createState() => _MainProfileState();
}

class _MainProfileState extends State<MainProfile> {
  List<UsersModel> usersModel = [];
  // UsersModel? usersModel;
  bool statusRedEye = true;
  final formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passappController = TextEditingController();
  List<String> pathimage = [];
  List<File?> files = [];
  bool statusImage = false; //ไม่มีการเปลี่ยนแปลง

  late File file;

  @override
  void initState() {
    super.initState();
    // usersModel_ = widget.usersModel;
    convertStringToArray();
    getusers();
  }

  Future<Null> getusers() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String id = preferences.getString('id')!;
    // String username = preferences.getString('username')!;
    // String passapp = preferences.getString('passapp')!;
    // String img = preferences.getString('img')!;
    // print('######## userid = $id,username = $username,passapp = $passapp,img = $img');
    final api =
        '${MyConstant.domain}/pkoffice/api/getusers.php?isAdd=true&id=$id';
    await Dio().get(api).then((value) async {
      // print('## value for API Users ==>  $value');
      for (var item in json.decode(value.data!)) {
        UsersModel model = UsersModel.fromJson(item);
        var username = model.username.toString();
        var img = model.img!.toString();
        print('### ==>>>$username');
        print(' ###img ==>>>$img');
      }
    });
  }

  void convertStringToArray() async {
    // print('######## userid = $id,username = $username,passapp = $passapp,img = $img');
  }

  void clearField() {
    usernameController.clear();
    passappController.clear();
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 236, 236),
      
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          behavior: HitTestBehavior.opaque,
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0, left: 15, right: 15),
                  child: CustomAppBar(),
                ),
                SizedBox(height: 13),
                buildImage(size),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () => chooseImage(ImageSource.camera),
                      icon: Icon(Icons.add_a_photo),
                      iconSize: 70,
                      color: Colors.lightBlue,
                    ),
                    IconButton(
                      onPressed: () => chooseImage(ImageSource.gallery),
                      icon: Icon(Icons.add_photo_alternate),
                      iconSize: 70,
                      color: Color.fromARGB(255, 3, 211, 226),
                    ),
                  ],
                ),
                // builAppname(),
                buildUser(size),
                buildPassword(size),
                updateButtom(size),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<Null> chooseImage(ImageSource imageSource) async {
    try {
      var object = await ImagePicke
      // var object = await ImagePicker().getImage(
      //   source: imageSource,
      //   maxHeight: 800.0,
      //   maxWidth: 800.0,
      // );

      // setState(() {
      //   file = File(object.path);
      // });
    } catch (e) {}
  }

  Row updateButtom(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 18),
          width: size * 0.3,
          child: Padding(
            padding: const EdgeInsets.only(top: 25),
            child: ElevatedButton.icon(
              icon: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(
                  Icons.fingerprint,
                  color: Color.fromARGB(255, 8, 190, 166),
                  size: 70.0,
                ),
              ),
              label: Text(
                'แก้ไข',
                style: MyConstant().h2save(),
              ),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  String username = usernameController.text;
                  String passapp = passappController.text;
                  String img = pathimage.toString();

                  print(
                      '## username = $username, passapp = $passapp, image = $img');
                  checkLogin(username: username, passapp: passapp);
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

  Future<Null> checkLogin({String? username, String? passapp}) async {
    String apicheckLogin =
        '${MyConstant.domain}/pkoffice/api/signin.php?isAdd=true&username=$username';
    await Dio().get(apicheckLogin).then((value) async {
      print('## value for API  ==>  $value');
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String id = preferences.getString('id')!;
      print('######## userid = $id');
      if (value.toString() == 'null') {
        String path =
            '${MyConstant.domain}/pkoffice/api/updateprofile.php?isAdd=true&username=$username&id=$id&password=$passapp';
        Response res = await Dio().get(path);
        print('######## ressssssss = $res');
        try {
          if (res.toString() == 'true') {
            MyDialog()
                .normalDialog(context, 'Update Profile Success', 'Success');
            clearField();
          } else {
            MyDialog()
                .normalDialog(context, 'Update Profile UnSuccess', 'UnSuccess');
          }
        } catch (e) {}
      } else {
        MyDialog().normalDialog(
            context, 'มี $username ในฐานข้อมูลแล้ว', 'Username ซ้ำ');
      }
    });
  }

  Row buildPassword(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 25),
          width: size * 0.4,
          child: TextFormField(
            controller: passappController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอก Password';
              } else {
                return null;
              }
            },
            obscureText: statusRedEye,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      statusRedEye = !statusRedEye;
                    });
                  },
                  icon: statusRedEye
                      ? const Icon(
                          Icons.remove_red_eye,
                          color: Color.fromARGB(255, 27, 207, 180),
                        )
                      : const Icon(
                          Icons.remove_red_eye_outlined,
                          color: Color.fromARGB(255, 27, 207, 180),
                        )),
              labelStyle: MyConstant().h2(),
              labelText: 'Password ',
              prefixIcon: const Icon(
                Icons.lock_open,
                color: Color.fromARGB(255, 27, 207, 180),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 27, 207, 180)),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.warning),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row buildUser(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 25),
          width: size * 0.4,
          child: TextFormField(
            controller: usernameController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'กรุณากรอก username';
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              labelStyle: MyConstant().h2(),
              labelText: 'Username ',
              prefixIcon: const Icon(
                Icons.account_circle,
                color: Color.fromARGB(255, 27, 207, 180),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 27, 207, 180)),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.warning),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row buildImage(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 30),
          width: size * 0.5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: CircleAvatar(
              radius: 150,
              child: Image.asset(
                "images/technician_1.png",
                // "images/techserevice.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
