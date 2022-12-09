import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///代码调试演示
class DemoDebugWidgetWidget extends StatefulWidget {
  final String pageFrom;

  DemoDebugWidgetWidget({this.pageFrom});

  @override
  State<StatefulWidget> createState() {
    return DemoDebugWidgetState();
  }
}

class DemoDebugWidgetState extends State<DemoDebugWidgetWidget> {
  int _result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("代码调试"),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("123*321的计算结果是?"),
            Text(_result == 0 ? "" : _result.toString()),
            RawMaterialButton(
              onPressed: () {
                startCalculation();
              },
              child: Text("开始计算"),
            )
          ],
        ),
      ),
    );
  }

  void startCalculation() {
    setState(() {
      _result = 123 * 321;
    });
  }
}
