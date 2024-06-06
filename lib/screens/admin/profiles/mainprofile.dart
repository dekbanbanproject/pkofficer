import 'dart:convert';
import 'dart:io';
// import 'dart:nativewrappers/_internal/vm/lib/math_patch.dart';
import 'dart:math';

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
  // List<dynamic> img = [];
  bool statusImage = false; //ไม่มีการเปลี่ยนแปลง
  final picker = ImagePicker();
  File? imageFile;
  // Uint8List? img;

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
                    // Positioned(
                    //   bottom: -0,
                    //   left: 140,
                    //   child: IconButton(
                    //     onPressed: () => chooseImage(ImageSource.camera),
                    //     icon: Icon(Icons.add_a_photo),
                    //     iconSize: 70,
                    //     color: Colors.lightBlue,
                    //   ),
                    // ),
                    IconButton(
                      onPressed: () => chooseImage(ImageSource.camera),
                      icon: Icon(Icons.add_a_photo),
                      iconSize: 70,
                      color: Colors.lightBlue,
                    ),
                    IconButton(
                      onPressed: () => chooseImage(ImageSource.gallery),
                      icon: Icon(Icons.add_photo_alternate),
                      iconSize: 75,
                      color: Color.fromARGB(255, 3, 211, 226),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          imageFile = null;
                        });
                      },
                      icon: Icon(Icons.delete),
                      iconSize: 70,
                      color: Color.fromARGB(255, 226, 3, 88),
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
                backgroundImage:
                    imageFile != null ? FileImage(imageFile!) : null),
            // backgroundImage: NetworkImage("images/technician_1.png"),
            // child: imgFile == null
            //     ? Image.asset("images/technician_1.png", fit: BoxFit.cover)
            //     : Image.file(imgFile)),
            // child: imgFile != null ? FileImage(imgFile) : null,
            // Positioned(
            //   bottom: -0,
            //   left: 140,
            //   child: IconButton(
            //     onPressed: () => chooseImage(ImageSource.camera),
            //     icon: Icon(Icons.add_a_photo),
            //     iconSize: 70,
            //     color: Colors.lightBlue,
            //   ),
            // ),
          ),
        ),
      ],
    );
  }

  chooseImage(ImageSource imageSource) async {
    // final ImagePicker picker = ImagePicker();
    // try {
    final pickedFile = await picker.pickImage(source: imageSource);
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
    // var object = await picker.getImage(
    //   source: imageSource,
    //   maxHeight: 800.0,
    //   maxWidth: 800.0,
    // );
    // var object = await ImagePicker().getImage(
    //   source: imageSource,
    //   maxHeight: 800.0,
    //   maxWidth: 800.0,
    // );

    // setState(() {
    //   img = XFile(object!.path);
    // });
    // } catch (e) {}
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
                  updateUsersNew(username: username, passapp: passapp);
                  // chooseImage(ImageSource.camera);
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

  Future<Null> updateUsersNew({String? username, String? passapp}) async {
    String urlUpload =
        '${MyConstant.domain}/pkoffice/api/saveimgProfile.php?isAdd=true';
    Random random = Random();
    int i = random.nextInt(1000000);
    String nameFile = 'img$i.jpg';

    try {
      Map<String, dynamic> map = Map();
      map['pickedFile'] =
          await MultipartFile.fromFile(imageFile!.path, filename: nameFile);
      FormData formData = FormData.fromMap(map);
      await Dio().post(urlUpload, data: formData).then((value) async {
        String urlPathImage = '/pkoffice/images/Profile/$nameFile';
        print('######## urlPathImage = ${MyConstant.domain}$urlPathImage');

        String apiget = '${MyConstant.domain}/pkoffice/api/signin.php?isAdd=true&username=$username';
        await Dio().get(apiget).then((value) async {
          print('## value for API  ==>  $value');
          SharedPreferences preferences = await SharedPreferences.getInstance();
          String id = preferences.getString('id')!;
          print('######## userid = $id');
          if (value.toString() == 'null') {
            String apiinsert =
                '${MyConstant.domain}/pkoffice/api/updateprofile.php?isAdd=true&username=$username&id=$id&password=$passapp&img_path=$urlPathImage';
            Response res = await Dio().get(apiinsert);
            print('######## ressssssss = $res');
            try {
              if (res.toString() == 'true') {
                MyDialog()
                    .normalDialog(context, 'Update Profile Success', 'Success');
                clearField();
              } else {
                MyDialog().normalDialog(
                    context, 'Update Profile UnSuccess', 'UnSuccess');
              }
            } catch (e) {}
          } else {
            MyDialog().normalDialog(
                context, 'มี $username ในฐานข้อมูลแล้ว', 'Username ซ้ำ');
          }
        });
      });
    } catch (e) {}
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
}
