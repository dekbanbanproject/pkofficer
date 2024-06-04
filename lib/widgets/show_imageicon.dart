import 'package:flutter/material.dart';


class ShowImageIcone extends StatelessWidget {
  final String path;
  const ShowImageIcone({super.key,required this.path});

  @override
  Widget build(BuildContext context) {
    return Image.asset(path);
  }
}