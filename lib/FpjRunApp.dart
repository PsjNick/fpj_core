import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'config/fpj_global.dart';

Future fpjRunApp({
  required Widget app,
  VoidCallback? onInit,
  String configLocalKVName = "Storage",
})async{

  FPJ_GLOBAL_LocalKVName = configLocalKVName;

  WidgetsFlutterBinding.ensureInitialized();

  if(onInit != null){
    onInit();
  }

  await GetStorage.init(configLocalKVName);

  runApp(app);

}