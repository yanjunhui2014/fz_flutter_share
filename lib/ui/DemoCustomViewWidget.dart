import 'dart:async';

import 'package:ShareDemo/utils/FZLog.dart';
import 'package:ShareDemo/widget/CircleProgressWidget.dart';
import 'package:ShareDemo/widget/ColorWidget.dart';
import 'package:ShareDemo/widget/FZSimpleDialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

///自定义view-demo
class DemoCustomViewWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DemoCustomViewState();
}

class DemoCustomViewState extends State<DemoCustomViewWidget> {
  double maxValue = 5000.0;
  double curValue = 0.0;

  Timer periodic;

  @override
  void dispose() {
    periodic?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('自定义view-demo'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              width: 100,
              height: 50,
            ),
            CircleProgressWidget(maxValue, curValue % 5000,
                width: 100, height: 100),
            Container(
              width: 100,
              height: 20,
            ),
            RawMaterialButton(
              onPressed: () {
                startProgress();
              },
              child: Text("开始转"),
            ),
            Container(
              width: 100,
              height: 50,
            ),
            RawMaterialButton(
              onPressed: () {
                showCustomDialog();
              },
              child: Text("显示自定义对话框"),
            ),
            Container(
              width: 100,
              height: 50,
            ),
            ColorWidget()
          ],
        ),
      ),
    );
  }

  void startProgress() {
    periodic = Timer.periodic(Duration(milliseconds: 16), (timer) {
      setState(() {
        curValue += 16;
      });
    });
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
