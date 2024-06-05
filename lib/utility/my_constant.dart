import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MyConstant {
  static String APPLICATION_JSON = "application/json";
  static String CONTENT_TYPE = "content-type";
  static String ACCEPT = "accept";
  static String AUTHORIZATION = "authorization";
  static String DEFAULT_LANGUAGE = "en";
  static String TOKEN = "token";
  static String BASE_URL =
      "http://smarthos-phukieohos.moph.go.th/pkbackoffice/public/api/pull_hosapi";

  static String appName = 'PK-OFFice';
  // static String domain = 'http://27.254.191.157/';
  static String domain                   = 'http://smarthos-phukieohos.moph.go.th';
  static String authenspsch              = 'http://smarthos-phukieohos.moph.go.th/pkbackoffice/public/api/authen_spsch';
  static String authenspsch_mini         = 'http://smarthos-phukieohos.moph.go.th/pkbackoffice/public/api/authen_spsch_mini';
  static String pullhos                  = 'http://smarthos-phukieohos.moph.go.th/pkbackoffice/public/api/pull_hosapi'
  ;
  static String pullhosminiapi           = 'http://smarthos-phukieohos.moph.go.th/pkbackoffice/public/api/pull_hosminiapi';

  static String fdh_mini_auth            = 'http://smarthos-phukieohos.moph.go.th/pkbackoffice/public/api/fdh_mini_auth';
  static String fdh_mini_pullhosinv      = 'http://smarthos-phukieohos.moph.go.th/pkbackoffice/public/api/fdh_mini_pullhosinv';

  static String fdh_minipullhosnoinv     = 'http://smarthos-phukieohos.moph.go.th/pkbackoffice/public/api/fdh_minipullhosnoinv';
  
  static String fdh_mini_pidsit          = 'http://smarthos-phukieohos.moph.go.th/pkbackoffice/public/api/fdh_mini_pidsit';
  static String fdh_mini_pullbookid      = 'http://smarthos-phukieohos.moph.go.th/pkbackoffice/public/api/fdh_mini_pullbookid';
  static String fdh_countvn              = 'http://smarthos-phukieohos.moph.go.th/pkbackoffice/public/api/fdh_countvn';
  static String fdh_sumincome            = 'http://smarthos-phukieohos.moph.go.th/pkbackoffice/public/api/fdh_sumincome';
  static String fdh_countpidsit          = 'http://smarthos-phukieohos.moph.go.th/pkbackoffice/public/api/fdh_countpidsit';
  static String fdh_countbookid          = 'http://smarthos-phukieohos.moph.go.th/pkbackoffice/public/api/fdh_countbookid';
  static String fdh_countauthen          = 'http://smarthos-phukieohos.moph.go.th/pkbackoffice/public/api/fdh_countauthen';
  static String fdh_countauthennull      = 'http://smarthos-phukieohos.moph.go.th/pkbackoffice/public/api/fdh_countauthennull';
  static String fdh_sumincome_authen     = 'http://smarthos-phukieohos.moph.go.th/pkbackoffice/public/api/fdh_sumincome_authen';
  static String fdh_sumincome_noauthen   = 'http://smarthos-phukieohos.moph.go.th/pkbackoffice/public/api/fdh_sumincome_noauthen';
  static String getfirenum               = 'http://smarthos-phukieohos.moph.go.th/pkbackoffice/public/api/getfirenum';
  // static String countfiregreen           = 'http://smarthos-phukieohos.moph.go.th/pkoffice/api/countfire.php?isAddGREEN=true';
  static String countfiregreenall        = 'http://smarthos-phukieohos.moph.go.th/pkbackoffice/public/api/countfiregreenall'; 
  static String countfiregreen           = 'http://smarthos-phukieohos.moph.go.th/pkbackoffice/public/api/countfiregreen'; 

  static String countfireredall          = 'http://smarthos-phukieohos.moph.go.th/pkbackoffice/public/api/countfireredall';
  static String countfirered             = 'http://smarthos-phukieohos.moph.go.th/pkbackoffice/public/api/countfirered';
  static String countfireredrepaire      = 'http://smarthos-phukieohos.moph.go.th/pkbackoffice/public/api/countfireredrepaire';
  static String countfiregreenrepaire    = 'http://smarthos-phukieohos.moph.go.th/pkbackoffice/public/api/countfiregreenrepaire';
 static String fire_pramuan              = 'http://smarthos-phukieohos.moph.go.th/pkbackoffice/public/fire_pramuan';

  static String getFiredata              = 'http://smarthos-phukieohos.moph.go.th/pkoffice/api/getfire_detailsave.php?isAdd=true&';


  static String routeLogin = '/login';
  static String routeHome = '/home';
  static String routeUserPage = '/user';
  static String routeCameracctv = '/cameracctv';
  static String routeCctvhome = '/cctvhome';
  // static String routePoPage = '/po';
  static String routeAdminPage = '/admin';
  static String routeAdminnewPage = '/adminnew';
  static String routeMainCctvAdd = '/cctvadd';
  static String routeMainCctv = '/cctvmain';
  static String routeMaincctvReq = '/maincctvReq';
  static String routespachScreen = '/spachscreen';
 static String routemainfdh = '/mainfdh';
 static String routeauthenspsch = '/authen';
  static String routeMainfireshow = '/mainfireshow';
  static String routeFireMainPage = '/firemainpage';
  static String routeFireaddPage = '/fireadd';
  var version = const Text(
      // 'V.641105', style: TextStyle(color: Colors.white),
      'V.670511',
      style: TextStyle(
        color: Colors.orange,
        fontSize: 17,
      )
      // style: MyConstant().h2back(),
      );

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    return '?token=$token';
  }

  var apiUrl = '/gtw/api/signin.php?isAdd=true';

  getDataauth(apiUrl) async {
    var fullUrl = domain + apiUrl + await _getToken();
    return await http.get(Uri.parse(fullUrl), headers: _setHeaders());
  }

  static List<String> menus = [
    ' Dashboard  ',
    ' หนังสือราชการ  ',
    '    การลา    ',
    ' ประชุม/อบรม/ดูงาน  ',
    '  จัดซื้อจัดจ้าง  ',
    '  คลังวัสดุ  ',
  ];

  static List<Color> colors = [
    Colors.blueAccent.shade700,
    Colors.blueAccent.shade700,
    Colors.blueAccent.shade700,
    Colors.blueAccent.shade700,
    Colors.blueAccent.shade700,
    Colors.blueAccent.shade700,
  ];

  static List<Image> image = [
    Image.asset('images/logo.png'),
  ];

  // Image
  static String img1 = 'images/Job.png';
  static String img2 = 'images/logo.png';
  static String img3 = 'images/Payment.png';
  static String img_logo = 'images/logo.png';
  static String img5 = 'images/logogtw.png';

  //Color
  static Color primary = const Color(0xff3065f7);
  static Color danger = const Color(0xffff0000);
  static Color warning = const Color(0xffff3b00);
  static Color success = const Color(0xff3af75d);
  static Color info = const Color(0xff32bcf7);
  static Color dark = const Color(0xffa3a18c);
  static Color white = const Color(0xFFFFFFFF);
  static Color back = const Color(0xFF020202);
  static const kprimaryColor = Color(0xffF5F5F5);
  static const searchColor = Color.fromARGB(255, 252, 234, 224);
  static const kcontentColor = Color(0xffff660e);
  static const cctvhomeColor = Color.fromARGB(255, 253, 128, 44);
  static const cctvaddColor = Color.fromARGB(255, 14, 167, 255);
  static const kcctvtColor = Color.fromARGB(255, 14, 167, 255);
  static const cctvprofileColor = Color.fromARGB(255, 253, 49, 127);
  static const cctvtreportColor = Color.fromARGB(255, 10, 174, 196);

  //  static const Color primary = Color(0xFFf77080);
  static const secondary = Color(0xFFe96561);

  static const mainColor = Color(0xFF000000);
  static const darker = Color(0xFF3E4249);
  static const cardColor = Colors.white;
  static const appBgColor = Color(0xFFF7F7F7);
  static const appBarColor = Color(0xFFF7F7F7);
  static const bottomBarColor = Colors.white;
  static const inActiveColor = Colors.grey;
  static const shadowColor = Colors.black87;
  static const textBoxColor = Colors.white;
  static const textColor = Color(0xFF333333);
  static const glassTextColor = Colors.white;
  static const labelColor = Color(0xFF8A8989);
  static const glassLabelColor = Colors.white;
  static const actionColor = Color(0xFFe54140);

  static const yellow = Color(0xFFffcb66);
  static const green = Color(0xFFa2e1a6);
  static const pink = Color(0xFFf5bde8);
  static const purple = Color(0xFFcdacf9);
  static const red = Color(0xFFf77080);
  static const orange = Color(0xFFf5ba92);
  static const sky = Color(0xFFABDEE6);
  static const blue = Color(0xFF509BE4);

  static const listColors = [
    green,
    purple,
    yellow,
    orange,
    sky,
    secondary,
    red,
    blue,
    pink,
    yellow,
  ];
  //Style
  TextStyle h1() =>
      TextStyle(fontSize: 24, color: primary, fontWeight: FontWeight.bold);

  TextStyle h1dark() =>
      TextStyle(fontSize: 22, color: back, fontWeight: FontWeight.normal);

  TextStyle h1White() =>
      TextStyle(fontSize: 24, color: white, fontWeight: FontWeight.bold);
TextStyle appnameheader() =>
      const TextStyle(fontSize: 24, color: Color.fromARGB(255, 27, 207, 180), fontWeight: FontWeight.bold);
  TextStyle h2() =>
      const TextStyle(fontSize: 17, color: Color.fromARGB(255, 27, 207, 180), fontWeight: FontWeight.bold);
TextStyle h2title() =>
      const TextStyle(fontSize: 20, color: Color.fromARGB(255, 27, 207, 180), fontWeight: FontWeight.bold);
      TextStyle h1title() =>
      const TextStyle(fontSize: 40, color: Color.fromARGB(255, 27, 207, 180), fontWeight: FontWeight.bold);
  TextStyle h2save() => const TextStyle(
      fontSize: 20,
      color: Color.fromARGB(255, 11, 185, 162),
      fontWeight: FontWeight.bold);
      TextStyle h1save() => const TextStyle(
      fontSize: 30,
      color: Color.fromARGB(255, 11, 185, 162),
      fontWeight: FontWeight.bold);

  TextStyle h2White() =>
      TextStyle(fontSize: 20, color: white, fontWeight: FontWeight.bold);

  TextStyle h2info() =>
      TextStyle(fontSize: 17, color: info, fontWeight: FontWeight.bold);

  TextStyle h2dan() =>
      TextStyle(fontSize: 17, color: danger, fontWeight: FontWeight.bold);

  TextStyle h22dark() =>
      TextStyle(fontSize: 17, color: dark, fontWeight: FontWeight.bold);

  TextStyle h2dark() =>
      TextStyle(fontSize: 15, color: dark, fontWeight: FontWeight.bold);
  TextStyle h3dark() =>
      TextStyle(fontSize: 17, color: dark, fontWeight: FontWeight.bold);
  TextStyle h4dark() =>
      TextStyle(fontSize: 15, color: dark, fontWeight: FontWeight.bold);
  TextStyle h5dark() =>
      TextStyle(fontSize: 13, color: dark, fontWeight: FontWeight.bold);

  TextStyle h3() =>
      TextStyle(fontSize: 14, color: primary, fontWeight: FontWeight.bold);

  TextStyle h3white() =>
      TextStyle(fontSize: 14, color: white, fontWeight: FontWeight.bold);

  TextStyle h1back() =>
      TextStyle(fontSize: 24, color: back, fontWeight: FontWeight.bold);
  TextStyle h2back() =>
      TextStyle(fontSize: 20, color: back, fontWeight: FontWeight.bold);
  TextStyle h3back() =>
      TextStyle(fontSize: 17, color: back, fontWeight: FontWeight.bold);
  TextStyle h4back() =>
      TextStyle(fontSize: 15, color: back, fontWeight: FontWeight.bold);

  TextStyle h1whit24() =>
      TextStyle(fontSize: 24, color: white, fontWeight: FontWeight.bold);
  TextStyle h1whit20() =>
      TextStyle(fontSize: 20, color: white, fontWeight: FontWeight.bold);
  TextStyle h1whit17() =>
      TextStyle(fontSize: 17, color: white, fontWeight: FontWeight.bold);
  TextStyle h1cctv17() => const TextStyle(
      fontSize: 17,
      color: Color.fromARGB(255, 248, 143, 143),
      fontWeight: FontWeight.bold);

  Text showTitle(String title) => Text(
        title,
        style: h3white(),
      );

  //Button
  ButtonStyle mybuttonStyle() => ElevatedButton.styleFrom(
        // iconColor: Colors.orange,
        backgroundColor: const Color.fromARGB(255, 54, 186, 247),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      );

  BoxDecoration myBoxDecoration(String namePic) {
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage('images/$namePic'),
        fit: BoxFit.cover,
      ),
    );
  }

  SizedBox showlogo2() {
    return SizedBox(
      width: 360.0,
      child: Image.asset('images/logo.png'),
    );
  }
  // Mydialog()
}
