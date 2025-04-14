import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fpj_core/util/FpjUtilWithCrypto.dart';

import '../fpj_cores.dart';

///
///  create by : jie
///  2024/12/26
///
///
///
///

typedef ChainHandle = bool Function();

class FpjUtil with FpjUtilWithCrypto {
  FpjUtil() {}

  static Color genRandomColor() {
    return Color.fromARGB(
      255,
      Random.secure().nextInt(256),
      Random.secure().nextInt(256),
      Random.secure().nextInt(256),
    );
  }

  // 责任链
  Future chainHandler<T>({
    required List<Function> handles,
  }) async {
    for (var handle in handles) {
      bool isHandle = await handle();
      if (isHandle) {
        break;
      }
    }
  }

  clearFocus({BuildContext? context}) {
    try{
      BuildContext? co = context ?? Get.context;

      if (co == null) {
        return;
      }

      FocusScope.of(co).requestFocus(FocusNode());
    }finally{

    }

  }
}
