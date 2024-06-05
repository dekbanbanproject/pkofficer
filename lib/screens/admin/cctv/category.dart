import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int currentSlidebar = 0;
  int selectIndex = 0;

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
                    Navigator.pushNamed(
                      context,
                      ('/firemainpage'),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(90.0),
                    ),
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: 150,
                      width: 120,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("images/fire.png"),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Fire",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [ 
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      ('/mainairnew'),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(90.0),
                    ),
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 150,
                      width: 120,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("images/airnew.png"),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10), 
                const Text(
                  "Air",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      ('/cctvmain'),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(90.0),
                    ),
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: 150,
                      width: 120,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("images/cctv1.png"),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
                 const SizedBox(height: 10),
                const Text(
                  "CCTV",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [ 
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      ('/firemainpage'),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(90.0),
                    ),
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: 150,
                      width: 120,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("images/electrice.png"),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Electric",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [ 
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      ('/firemainpage'),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(90.0),
                    ),
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: 150,
                      width: 120,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("images/Plumbing.png"),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Plumbing",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [ 
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      ('/firemainpage'),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(90.0),
                    ),
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 150,
                      width: 120,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("images/tel_1.png"),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10), 
                const Text(
                  "Phone",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          
        ],
      ),
      //   child: Column(
      //     children: [
      //       Row(
      //         children: [
      //           Container(
      //             width: 150,
      //             margin: EdgeInsets.only(right: 20),
      //             height: 150,
      // decoration: BoxDecoration(
      //   color: Colors.blue.shade400,
      //   borderRadius: BorderRadius.all(
      //     Radius.circular(24),
      //   ),
      // ),
      //             child: Padding(
      //               padding: const EdgeInsets.all(12.0),
      //               child: Column(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   Text(
      //                     'Leave System /\nmonth',
      //                     style: TextStyle(fontSize: 20, color: Colors.white),
      //                   ),
      //                   SizedBox(
      //                     height: 5,
      //                   ),
      //                   Text(
      //                     '12 itms',
      //                     style: TextStyle(fontSize: 15, color: Colors.white),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ),
      //           Container(
      //             width: 150,
      //             margin: EdgeInsets.only(right: 20),
      //             height: 150,
      //             decoration: BoxDecoration(
      //               color: Colors.blue.shade400,
      //               borderRadius: BorderRadius.all(
      //                 Radius.circular(24),
      //               ),
      //             ),
      //             child: Padding(
      //               padding: const EdgeInsets.all(12.0),
      //               child: Column(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   Text(
      //                     'Leave System /\nmonth',
      //                     style: TextStyle(fontSize: 20, color: Colors.white),
      //                   ),
      //                   SizedBox(
      //                     height: 5,
      //                   ),
      //                   Text(
      //                     '12 itms',
      //                     style: TextStyle(fontSize: 15, color: Colors.white),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ),
      //           Container(
      //             width: 150,
      //             margin: EdgeInsets.only(right: 20),
      //             // height: chartHeight,
      //             height: 150,
      //             decoration: BoxDecoration(
      //               color: Colors.blue.shade400,
      //               borderRadius: BorderRadius.all(
      //                 Radius.circular(24),
      //               ),
      //             ),
      //             child: Padding(
      //               padding: const EdgeInsets.all(12.0),
      //               child: Column(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   Text(
      //                     'Leave System /\nmonth',
      //                     style: TextStyle(fontSize: 20, color: Colors.white),
      //                   ),
      //                   SizedBox(
      //                     height: 5,
      //                   ),
      //                   Text(
      //                     '12 itms',
      //                     style: TextStyle(fontSize: 15, color: Colors.white),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ),
      //           // Container(
      //           //   height: 65,
      //           //   width: 65,
      //           //   decoration: BoxDecoration(
      //           //     shape: BoxShape.circle,
      //           //     image: DecorationImage(
      //           //         image: AssetImage("images/cctv1.png"),
      //           //         fit: BoxFit.cover),
      //           //   ),
      //           // ),
      //           // SizedBox(height: 5),
      //           // Text(
      //           //   "CCTV",
      //           //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      //           // ),
      //           //  Container(
      //           //   height: 65,
      //           //   width: 65,
      //           //   decoration: BoxDecoration(
      //           //     shape: BoxShape.circle,
      //           //     image: DecorationImage(
      //           //         image: AssetImage("images/fire.png"),
      //           //         fit: BoxFit.cover),
      //           //   ),
      //           // ),
      // SizedBox(height: 5),
      // Text(
      //   "Fire",
      //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      // ),
      //         ],
      //       ),
      //     ],
      //   ),
      // ),
      // child: ListView.separated(
      //     scrollDirection: Axis.horizontal,
      //     itemBuilder: (context, index) {
      //       return Column(
      //         children: [
      // Container(
      //   height: 65,
      //   width: 65,
      //   decoration: BoxDecoration(
      //     shape: BoxShape.circle,
      //     image: DecorationImage(
      //         image: AssetImage(categories[index].image),
      //         fit: BoxFit.cover),
      //   ),
      // ),
      // SizedBox(height: 5),
      // Text(
      //   categories[index].title,
      //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      // ),
      //         ],
      //       );
      //     },
      //     separatorBuilder: (context, index) => const SizedBox(
      //           width: 20,
      //         ),
      //     itemCount: categories.length),
    );
  }
}
