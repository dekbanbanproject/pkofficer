import 'package:flutter/material.dart';

class ListCctv extends StatefulWidget {
  const ListCctv({super.key});

  @override
  State<ListCctv> createState() => _ListCctvState();
}

class _ListCctvState extends State<ListCctv> {
  // Widget currentWidget = ListCctv();
  late final String _scanBarcode = 'ยังไม่มีข้อมูล';
  final int _index = 0;
  @override
  void initState() {
    super.initState();
  }

  // Future<void> scanQR() async {
  //   String barcodeScanRes;
  //   // Platform messages may fail, so we use a try/catch PlatformException.
  //   try {
  //     barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
  //         '#ff6666', 'Cancel', true, ScanMode.QR);
  //     print(barcodeScanRes);
  //   } on PlatformException {
  //     barcodeScanRes = 'Failed to get platform version.';
  //   }
  //   if (!mounted) return;

  //   setState(() {
  //     _scanBarcode = barcodeScanRes;
  //   });
  // }



  @override
  Widget build(BuildContext context) {
    return const Text('ListCctv รายการกล้องวงจรปิด');
    // return Container(

    //   child: Padding(
    //     padding: const EdgeInsets.all(8.0),
    //     child: Container(
    //       child: SizedBox(
    //         height: 300,
    //         width: double.infinity,
    //         child: Card(
    //           child: Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 Text(
    //                   'Scan result : $_scanBarcode\n',
    //                   style: TextStyle(fontSize: 20),
    //                 )
    //               ],
    //             ),
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
