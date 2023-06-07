import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///跳转演示目标页
class DemoNavigationTargetWidget extends StatefulWidget {
  final String pageFrom;

  DemoNavigationTargetWidget({required this.pageFrom});

  @override
  State<StatefulWidget> createState() {
    return DemoNavigationTargetState();
  }
}

class DemoNavigationTargetState extends State<DemoNavigationTargetWidget> {
  String? _arguments;

  @override
  Widget build(BuildContext context) {
    _arguments = (ModalRoute.of(context)?.settings.arguments ?? "无") as String;

    return Scaffold(
      appBar: AppBar(
        title: Text("跳转目标页"),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("跳转来源：" + widget.pageFrom ?? '未知'),
            Text("想说的:" + _arguments!)
          ],
        ),
      ),
    );
  }
}
