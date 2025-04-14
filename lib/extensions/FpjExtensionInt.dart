import 'package:fpj_core/fpj_cores.dart';

extension FpjExtensionInt on int {
  Future delaySeconds() {
    return Future.delayed(Duration(seconds: this));
  }

  Duration durationSeconds() {
    return Duration(seconds: this);
  }

  String dateTime({String format = "yyyy-MM-dd HH:mm:ss"}) {
    try {
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(this);

      return DateUtil.formatDate(dateTime, format: format);
    } catch (e) {
      return "";
    }
  }
}
