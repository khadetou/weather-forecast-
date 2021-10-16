// ignore_for_file: non_constant_identifier_names

import "package:intl/intl.dart";

class Util {
  static String appId = "4b41ceb5b8bebe075dff56941b78eb4d";
  static String getFormatedDate(DateTime datetime) {
    return DateFormat('EEEE, MMM d, ' 'y').format(datetime);
  }

  static double Celcius({double? Ferenheit}) {
    return ((Ferenheit! - 32) * 5) / 9;
  }
}
