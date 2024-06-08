import 'package:flutter/material.dart';
import 'package:pkofficer/states/signout.dart';
import 'package:pkofficer/utility/my_constant.dart';
import 'package:pkofficer/widgets/show_title.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                style: IconButton.styleFrom(
                    backgroundColor: MyConstant.kprimaryColor,
                    padding: const EdgeInsets.all(10)),
                onPressed: () {},
                iconSize: 50,
                color: Colors.lightBlue,
                icon: const Icon(Icons.beenhere),
              ),
              Row(
                children: [ 
                  ShowTitle(
                      title: MyConstant.appbar,
                      textStyle: MyConstant().h1title(),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15), 
                    child: ShowTitle(
                      title: MyConstant.version,
                      textStyle: MyConstant().h4version(),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                style: IconButton.styleFrom(
                    backgroundColor: MyConstant.kprimaryColor,
                    padding: const EdgeInsets.all(10)),
                onPressed: () {},
                // onPressed: () => Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => Authenspsch(),
                //       ),
                //     ),
                // onPressed: () {
                //   Navigator.pop(context);
                //   MaterialPageRoute route =
                //       MaterialPageRoute(builder: (context) => MainFdh());
                //   Navigator.push(context, route);
                // },
                iconSize: 50,
                icon: const Icon(Icons.notifications_outlined),
                color: Colors.lightBlue,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: IconButton(
                  style: IconButton.styleFrom(
                      backgroundColor: MyConstant.kprimaryColor,
                      padding: const EdgeInsets.all(10)),
                  iconSize: 50,
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
