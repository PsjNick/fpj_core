import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:fpj_core/fpj_cores.dart';
import 'package:get_storage/get_storage.dart';
import '../config/fpj_global.dart';

final GetStorage _getStorage = GetStorage(FPJ_GLOBAL_LocalKVName);

extension FpjExtensionString on String {
  T? getFromLocalKV<T>() {
    return _getStorage.read<T>(this);
  }

  setToLocalKV(Object? value) async {
    if (value == null) {
      return;
    }
    return await _getStorage.write(this, value);
  }

  delFromLocalKV() {
    _getStorage.remove(this);
  }

  //  颜色
  Color toColor() {
    try {
      String hexColor = this.toUpperCase().replaceAll("#", "");

      if (hexColor.length == 6) {
        hexColor = "FF$hexColor";
      }
      return Color(int.parse(hexColor, radix: 16));
    } catch (e) {
      return Colors.transparent;
    }
  }

  //  拷贝到剪切板
  Future<bool> copyToClipBoard({bool showTip = false}) async {
    try {
      await FlutterClipboard.copy(this);

      if (showTip) {
        "copy success".toast(bgColor: Colors.green);
      }

      return true;
    } catch (e) {
      if (showTip) {
        "copy fail".toast(bgColor: Colors.red);
      }

      return false;
    }
  }

  //  某个字符在字符串中出现的次数
  int repeatNum({required String checkStr}) {
    List<String> contens = this.split(checkStr);
    return contens.length - 1;
  }

  /// 是否为我想要的小数字符串
  /// maxDecimalNum: 最长小数位
  bool checkIsIWhatDoubleStr({int? maxDecimalNum}) {
    if (double.tryParse(this) == null) {
      return false;
    }

    // if (this.startsWith("00")) {
    //   return false;
    // }

    if (this.contains(".")) {
      List<String> contens = this.split(".");

      if (contens.length > 2) {
        return false;
      }

      if (maxDecimalNum != null && contens[1].length > maxDecimalNum) {
        return false;
      }
    }
    return true;
  }


  double? strToDouble() {
    try {
      if (!this.checkIsIWhatDoubleStr()) {
        return null;
      }

      return double.tryParse(this);
    } catch (e) {
      return null;
    }
  }


}
