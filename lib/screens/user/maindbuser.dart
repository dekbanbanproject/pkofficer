import 'package:flutter/material.dart';
import 'package:pkofficer/screens/user/usercategory.dart';
import 'package:pkofficer/widgets/userbar.dart';

class MainDbUser extends StatefulWidget {
  const MainDbUser({super.key});

  @override
  State<MainDbUser> createState() => _MainDbUserState();
}

class _MainDbUserState extends State<MainDbUser> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 221, 239, 253),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15),
              //for custom appbar
              UserBar(),
              //for searchbar
              // SizedBox(height: 15),
              // MySearchBar(),
              SizedBox(height: 20),
              UserCategory(),
              SizedBox(height: 20),
              // FdhCategory(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
