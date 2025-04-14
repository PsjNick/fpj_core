import 'package:common_utils/common_utils.dart';

///  create by —— jie
///  2024/12/26 15:24

mixin FpjUtilWithCrypto {

  String encode({required String orgStr, required String key}) {
    String encode = EncryptUtil.xorBase64Encode(orgStr, key); // WH1YHgMs
    return encode;
  }

  String decode({required String secStr, required String key}) {
    String decode = EncryptUtil.xorBase64Decode(secStr, key); // WH1YHgMs
    return decode;
  }

}