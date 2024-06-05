import 'package:flutter/material.dart';
import 'package:pkofficer/widgets/home_app_bar.dart';

class MainAirHome extends StatefulWidget {
  const MainAirHome({super.key});

  @override
  State<MainAirHome> createState() => _MainAirHomeState();
}

class _MainAirHomeState extends State<MainAirHome> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 248, 248),
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
              
            ],
          ),
        ),
      ),
    );
  }
}