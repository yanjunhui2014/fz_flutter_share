import 'dart:async';

import 'package:ShareDemo/ui/DemoAnimWidget.dart';
import 'package:ShareDemo/ui/DemoCustomViewWidget.dart';
import 'package:ShareDemo/ui/DemoDebugWidget.dart';
import 'package:ShareDemo/ui/DemoGustureWidget.dart';
import 'package:ShareDemo/ui/DemoLandscapeWidget.dart';
import 'package:ShareDemo/ui/DemoNetworkWidget.dart';
import 'package:ShareDemo/utils/FZLog.dart';
import 'package:flutter/material.dart';

import 'ui/DemoGrammarSugarWidget.dart';
import 'ui/DemoNavigationTargetWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  static const Router_DemoGrammarSugar = 'demo/DemoGrammarSugarWidget';
  static const Router_DemoNavigation = 'demo/DemoNavigationTargetWidget';
  static const Router_DemoDebug = "demo/DemoDebugWidgetWidget";
  static const Router_DemoNetwork = "demo/DemoNetwork";
  static const Router_DemoGusture = "demo/DemoGusture";
  static const Router_DemoAnim = "demo/DemoAnim";
  static const Router_CustomView = "demo/RouterCustomView";
  static const Router_Landscape = "demo/Landscape";


  Map<String, WidgetBuilder> routers = {
    "$Router_DemoGrammarSugar": (BuildContext context) =>
        DemoGrammarSugarWidget(),
    "$Router_DemoNavigation": (BuildContext context) =>
        DemoNavigationTargetWidget(pageFrom: "pushNamed路由策略"),
    "$Router_DemoDebug": (BuildContext context) =>
        DemoDebugWidgetWidget(),
    "$Router_DemoNetwork": (BuildContext context) =>
        DemoNetworkWidget(),
    "$Router_DemoGusture": (BuildContext context) =>
        DemoGustureWidget(),
    "$Router_DemoAnim": (BuildContext context) =>
        DemoAnimWidget(1),
    "$Router_CustomView": (BuildContext context) =>
        DemoCustomViewWidget(),
    "$Router_Landscape": (BuildContext context) =>
        DemoLandscpeWidget(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: routers,
      home: MyHomePage(title: 'Flutter Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _itemButton('语法糖', MyApp.Router_DemoGrammarSugar),
            _itemButton('页面跳转', MyApp.Router_DemoNavigation),
            _itemButton("代码调试", MyApp.Router_DemoDebug),
            _itemButton("测试第三方sdk(网络请求)", MyApp.Router_DemoNetwork),
            _itemButton("手势学习", MyApp.Router_DemoGusture),
            _itemButton("动画学习", MyApp.Router_DemoAnim),
            _itemButton("自定义view学习", MyApp.Router_CustomView),
            _itemButton("进入横屏界面", MyApp.Router_Landscape),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _itemButton(String title, String routeName) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          if (routeName == MyApp.Router_DemoNavigation) {
            showNavigationDialog(routeName);
          } else if (routeName == MyApp.Router_DemoAnim) {
            showAnimDialog();
          } else {
            Navigator.pushNamed(context, routeName);
          }
        },
        child: Text(title),
      ),
    );
  }

  Future<void> showNavigationDialog(String routeName) async {
    FZLog.d(" showNavigationDialog ");
    int i = await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('请选跳转方式'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop();//必须在push之前调用，否则无法正常关闭对话框或正常跳转
                  Navigator.pushNamed(context, routeName,
                          arguments: "大罗是我们村最靓的仔")
                      .then((value) => {});
                  // dismissDialog(context);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('pushNamed路由策略'),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          DemoNavigationTargetWidget(pageFrom: "push策略"),
                      settings: RouteSettings(arguments: "行者孙，我叫一声你敢答应吗")));
                  // dismissDialog(context);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('push策略'),
                ),
              ),
            ],
          );
        });
  }

  Future<void> showAnimDialog() async {
    FZLog.d(" showAnimDialog ");
    int i = await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('请选动画方式'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop();//必须在push之前调用，否则无法正常关闭对话框或正常跳转
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          DemoAnimWidget(DemoAnimWidget.type_gif)));
                  // dismissDialog(context);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('gif动画'),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          DemoAnimWidget(DemoAnimWidget.type_lottie)));
                  // dismissDialog(context);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('lottie动画'),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          DemoAnimWidget(DemoAnimWidget.type_system)));
                  // dismissDialog(context);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('系统动画'),
                ),
              ),
            ],
          );
        });
  }

}
