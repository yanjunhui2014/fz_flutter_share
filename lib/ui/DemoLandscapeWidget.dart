import 'package:ShareDemo/widget/FZSimpleDialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

///横竖屏切换demo
class DemoLandscpeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    //进入横屏状态
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    return DemoLandscpeState();
  }
}

class DemoLandscpeState extends State<DemoLandscpeWidget> {
  @override
  void dispose() {
    //退出时，切换为竖屏状态
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("界面横屏"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                showCustomDialog();
              },
              child: Text("显示自定义对话框"),
            ),
          ],
        ),
      ),
    );
  }

  void showCustomDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return FZSimpleDialog(
            "是真的嘛",
            '大罗使我们村最靓的仔',
            mConfirm: "真的",
            mCancel: "假的",
            orientation: FZSimpleDialog.landscape,
            mOnClickListener: (e) {
              if (e == FZSimpleDialog.EVENT_CANCEL) {
                Fluttertoast.showToast(msg: "你的良心不会痛吗");
              } else if (e == FZSimpleDialog.EVENT_CONFIRM) {
              }
            },
          );
        });
  }
}

//step0 ： 常规演示
//step1 :  代码虽然简洁，但是也要提出在趣启蒙，因为采用了FlutterBoost而踩得坑，FlutterBoost 加大了界面横竖屏切换的难度
//step2 :  注释line57，查看界面异常现象，并讲解原因（横竖屏切换后，屏幕宽高取值变换，与ios一致，与android不一致）
