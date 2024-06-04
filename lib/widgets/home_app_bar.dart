import 'package:flutter/material.dart';
import 'package:pkofficer/states/signout.dart';
import 'package:pkofficer/utility/my_constant.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                style: IconButton.styleFrom(
                    backgroundColor: MyConstant.kprimaryColor,
                    padding: const EdgeInsets.all(20)),
                onPressed: () {}, iconSize: 30, color: Colors.lightBlue,
                icon: const Icon(Icons.dashboard), 
              ),
               Text(' V.670604',style: MyConstant().h2title(),),
            ],
          ),
          Row(
            children: [
              // IconButton(
              //   style: IconButton.styleFrom(
              //       backgroundColor: MyConstant.kprimaryColor,
              //       padding: const EdgeInsets.all(20)),
              //   onPressed: () {},
              //   // onPressed: () => Navigator.push(
              //   //       context,
              //   //       MaterialPageRoute(
              //   //         builder: (context) => Authenspsch(),
              //   //       ),
              //   //     ),
              //   // onPressed: () {
              //   //   Navigator.pop(context);
              //   //   MaterialPageRoute route =
              //   //       MaterialPageRoute(builder: (context) => MainFdh());
              //   //   Navigator.push(context, route);
              //   // },
              //   iconSize: 30,
              //   icon: const Icon(Icons.notifications_outlined),
              //   color: Colors.lightBlue,
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: IconButton(
                  style: IconButton.styleFrom(
                      backgroundColor: MyConstant.kprimaryColor,
                      padding: const EdgeInsets.all(20)),
                  iconSize: 30,
                  icon: const Icon(Icons.logout),
                  color: Colors.red,
                  tooltip: 'Logout',
                  onPressed: () => signoutProcess(context),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
