import 'package:flutter/material.dart';
import 'package:pkofficer/utility/my_constant.dart';
import 'package:pkofficer/widgets/show_image.dart';
import 'package:pkofficer/widgets/show_title.dart';

class MyDialog {
  // get title => null;

  Future<Null> normalDialog(
      BuildContext context, String message, String title) async {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: ListTile(
          leading: ShowImage(path: MyConstant.img2),
          title: ShowTitle(title: title, textStyle: MyConstant().h2dan()),
          subtitle: ShowTitle(title: message, textStyle: MyConstant().h3dark()),
        ),
        children: [
          TextButton(
              onPressed: () => Navigator.pop(context), child: const Text('OK'))
        ],
      ),
    );
  }
}
