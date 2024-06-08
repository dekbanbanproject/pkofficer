import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pkofficer/models/usersModel.dart';
import 'package:pkofficer/utility/my_constant.dart';
import 'package:pkofficer/utility/my_dialog.dart';
import 'package:pkofficer/widgets/show_image.dart';
import 'package:pkofficer/widgets/show_title.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool statusRedEye = true;
  final formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passappController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 214, 247),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          behavior: HitTestBehavior.opaque,
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                buildImage(size),
                builAppname(),
                buildUser(size),
                buildPassword(size),
                buildSubmitlogin(size),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row buildSubmitlogin(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 18),
          width: size * 0.3,
          // child: ElevatedButton(
          //   style: MyConstant().mybuttonStyle(),
          // onPressed: () {
          //   if (formKey.currentState!.validate()) {
          //     String username = usernameController.text;
          //     String passapp = passappController.text;
          //     print('## username = $username, passapp = $passapp');
          //     checkLogin(username: username, passapp: passapp);
          //     // checkAuthen();
          //   }
          //   },
          //   // child: Text('Login',style: MyConstant().h2White(),),
          // ),
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ElevatedButton.icon(
              icon: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(
                  Icons.fingerprint_rounded,
                  color: Color.fromARGB(255, 8, 190, 166),
                  size: 40.0,
                ),
              ),
              label: Text(
                'Login',
                style: MyConstant().h1login(),
              ),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  String username = usernameController.text;
                  String passapp = passappController.text;
                  print('## username = $username, passapp = $passapp');
                  checkLogin(username: username, passapp: passapp);
                  // checkAuthen();
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

      if (value.toString() == 'null') {
        MyDialog().normalDialog(
            context, 'ไม่มี $username ในฐานข้อมูล', 'Username ผิด');
      } else {
        for (var item in json.decode(value.data!)) {
          UsersModel model = UsersModel.fromJson(item);
          if (passapp == model.passapp) {
            String? type = model.type;
             String? username = model.username;
              String? id = model.id;
            print('## value for API ===> $type');
            SharedPreferences preferences =
                await SharedPreferences.getInstance();
            preferences.setString('type', type!);
            preferences.setString('username', username!);
            preferences.setString('id', id!);

            switch (type) {
              case 'ADMIN':
                Navigator.pushNamedAndRemoveUntil(
                    context, MyConstant.routeAdminnewPage, (route) => false);
                break;
              case 'USER':
                Navigator.pushNamedAndRemoveUntil(
                    context, MyConstant.routeUserPage, (route) => false);
                break;

              default:
            }
          } else {
            MyDialog().normalDialog(
                context, 'ไม่มี $passapp ในฐานข้อมูล', 'Password ผิด');
          }
        }
      }
    });

    // await Dio().get{apicheckLogin}.then((value){
  }

  Row buildPassword(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 15),
          width: size * 0.5,
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
                      ? Icon(
                          Icons.remove_red_eye,
                          color: Color.fromARGB(255, 27, 207, 180),
                        )
                      : Icon(
                          Icons.remove_red_eye_outlined,
                          color: Color.fromARGB(255, 27, 207, 180),
                        )),
              labelStyle: MyConstant().h2(),
              labelText: 'Password ',
              prefixIcon: Icon(
                Icons.lock_open,
                color: Color.fromARGB(255, 27, 207, 180),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 27, 207, 180)),
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
          width: size * 0.5,
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
              prefixIcon: Icon(
                Icons.account_circle,
                color: Color.fromARGB(255, 27, 207, 180),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 27, 207, 180)),
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

  Row builAppname() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 30),
          child: ShowTitle(
            title: MyConstant.appName,
            textStyle: MyConstant().appnameheader(),
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
          height: 200,
          width: 200,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: AssetImage("images/logo.png"), fit: BoxFit.cover),
          ),
          margin: const EdgeInsets.only(top: 200),
          // width: size * 0.3,
          // child: ShowImage(path: MyConstant.img_logo),
        ),
      ],
    );
  }
}
