import 'package:flutter/material.dart';
import 'package:pkofficer/widgets/home_app_bar.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
     return const Scaffold(
       backgroundColor: Color.fromARGB(255, 250, 236, 236),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15),
              //for custom appbar
              CustomAppBar(),
              //for searchbar
              SizedBox(height: 15),
              Center(
                child: Text(
                  'SettingPage',style: TextStyle(fontSize: 50,color: Color.fromARGB(255, 27, 207, 180)), 
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}