import 'dart:convert';

import 'package:ShareDemo/data/bean/joke_bean_entity.dart';
import 'package:ShareDemo/generated/json/base/json_convert_content.dart';
import 'package:dio/dio.dart';

import 'net_callback.dart';
import 'net_config.dart';

class NetManager with NetConfig {
  // 工厂模式
  factory NetManager() => _getInstance();

  static NetManager get instance => _getInstance();
  static NetManager _instance;

  NetManager._();

  static NetManager _getInstance() {
    if (_instance == null) {
      _instance = NetManager._();
    }
    return _instance;
  }

  void queryJokeData(NetCallback<JokeBeanResult> netCallback) async {
    Dio dio = new Dio();
    Options options = dio.options;
    options.baseUrl = "http://v.juhe.cn";
    options.responseType = ResponseType.PLAIN;

    Map<String, dynamic> data = new Map<String, dynamic>();
    data["key"] = 'c733ce5e333a4e3af6fb4e3223a3a9e2';
    data["page"] = '1';
    data["pagesize"] = '10';
    data["sort"] = 'asc';
    data["time"] = '1418745237';

    var response = await dio.get('/joke/content/list.php', data: data);
    var result = response.data.toString();

//    var response = await dio.get(
//        "http://v.juhe.cn/joke/content/list.php?key=c733ce5e333a4e3af6fb4e3223a3a9e2&page=1&pagesize=1&sort=asc&time=1418745237",
//        options: options);
//    var result = response.data.toString();

    Map<String, dynamic> map = jsonDecode(result);
    if (map["error_code"] == 0) {
      JokeBeanResult result =
          JsonConvert.fromJsonAsT<JokeBeanResult>(map['result']);
      netCallback.onSuccess(result);
    } else {
      netCallback.onFail(Exception(map["reason"]));
    }
  }
}
