import 'dart:io';

import 'package:flutter/cupertino.dart';

class Utils {
  Utils._();

  static final _instance = Utils._();

  factory Utils.getInstance() => _instance;

  getScreenWidth(BuildContext context) => MediaQuery.of(context).size.width;

  getScreenHeight(BuildContext context) => MediaQuery.of(context).size.height;

  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  // Future<String> getStoragePath() async {
  //   Directory directory;
  //   if (Platform.isAndroid) {
  //     directory = await getExternalStorageDirectory();
  //   } else if (Platform.isIOS) {
  //     directory = await getTemporaryDirectory();
  //   }
  //
  //   if (directory != null) {
  //     return directory.path;
  //   }
  // }

  // Future<String> cachePath() async {
  //   return await getStoragePath().then((value) => value + "/cache");
  // }

  static bool isEmpty(Object object){
    if(object == null){
      return true;
    }
    if(object is String){
      String string = object;
      if(string.isEmpty){
        return true;
      }
    }

    return false;
  }

}
