import 'package:flutter/material.dart';
import 'package:pkofficer/utility/my_constant.dart';
import 'package:pkofficer/utility/my_constant.dart';
import 'package:pkofficer/widgets/home_app_bar.dart';

class NortifyPage extends StatefulWidget {
  const NortifyPage({super.key});

  @override
  State<NortifyPage> createState() => _NortifyPageState();
}

class _NortifyPageState extends State<NortifyPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
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
                  'NortifyPage',style: TextStyle(fontSize: 50,color: Color.fromARGB(255, 27, 207, 180)), 
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
