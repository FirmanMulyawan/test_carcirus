import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConst {
  static String appName = "Firman Test";
  static bool isDebuggable = true;
  static String appUrl = "${dotenv.env['API_LINK']}/v2";
  static String apiKey = dotenv.env['API_KEY']!;
  static String defaultLocale = "id-ID";

  static String path = 'assets/';

  // icon
  static String arrowLeft = '${path}icons/ic_arrow_left.svg';
  static String arrowRight = '${path}icons/ic_arrow_right.svg';
  static String backButton = '${path}icons/ic_back.svg';
  static String carCrash = '${path}icons/ic_car_crash.svg';
  static String checkDuotone = '${path}icons/ic_check_duotone.svg';
  static String close = '${path}icons/ic_close.svg';
  static String date = '${path}icons/ic_date.svg';
  static String invoice = '${path}icons/ic_invoice.svg';
  static String layer1 = '${path}icons/ic_layer_1.svg';
  static String layer2 = '${path}icons/ic_layer_2.svg';
  static String layer3 = '${path}icons/ic_layer_3.svg';
  static String layer4 = '${path}icons/ic_layer_4.svg';
  static String logo = '${path}icons/ic_logo.svg';
  static String myCar = '${path}icons/ic_my_car.svg';
  static String person = '${path}icons/ic_person.svg';
  static String rental = '${path}icons/ic_rental.svg';
  static String time = '${path}icons/ic_time.svg';

  // images
  static String nissanSentra = '${path}images/im_nissan_sentra.png';
  static String nissanSentra2 = '${path}images/im_nissan_Sentra2.png';
  static String noInternetIcon = '${path}images/im_no_internet.png';
  static String toyotaPrius = '${path}images/im_toyota_prius.png';
}
