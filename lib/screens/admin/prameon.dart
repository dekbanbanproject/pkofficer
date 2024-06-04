import 'package:flutter/material.dart';
import 'package:pkofficer/utility/my_constant.dart';
import 'package:url_launcher/url_launcher.dart';

class Pramirn extends StatefulWidget {
  const Pramirn({super.key});

  @override
  State<Pramirn> createState() => _PramirnState();
}

class _PramirnState extends State<Pramirn> {
  final websiteUrl = Uri.parse(MyConstant.fire_pramuan);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      launchUrl(websiteUrl,
                          mode: LaunchMode.externalApplication);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 90,
                      width: 90,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("images/feedback_concept.png"),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Text(
                      "    แบบประเมินความพึงพอใจ \n   การใช้งานระบบสารสนเทศ \n ตรวจดูผลการเช็คถังดับเพลิง",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                // const SizedBox(height: 10),
                // ElevatedButton(
                //   onPressed: () {
                //     setState(() {
                //       launchUrl(websiteUrl,
                //           mode: LaunchMode.externalApplication);
                //     });
                //     // Navigator.pushNamed(context, ('/mainfdh'),);
                //   },
                //   style: ElevatedButton.styleFrom(
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(50.0),
                //     ),
                //     backgroundColor:  Color.fromARGB(255, 8, 190, 166),
                //   ),
                //   child: const Text('Click Link',style:
                //           TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),),
                // ),
              ],
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Column(
          //     children: [
          //       ElevatedButton(
          //          onPressed: () {
          //           Navigator.pushNamed(context, ('/authen'),);
          //         },
          //         style: ElevatedButton.styleFrom(
          //           shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(50.0),
          //           ),
          //           backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          //         ),
          //         child: Container(
          //           height: 90,
          //           width: 90,
          //           decoration: const BoxDecoration(
          //             shape: BoxShape.circle,
          //             image: DecorationImage(
          //                 image: AssetImage("images/authen.png"),
          //                 fit: BoxFit.cover),
          //           ),
          //         ),
          //       ),
          //       const SizedBox(height: 10),
          //       const Text(
          //         "Authen",
          //         style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
