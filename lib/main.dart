import 'dart:async';

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

  Map<String, WidgetBuilder> routers = {
    "$Router_DemoGrammarSugar": (BuildContext context) =>
        DemoGrammarSugarWidget(),
    "$Router_DemoNavigation": (BuildContext context) =>
        DemoNavigationTargetWidget(pageFrom: "pushNamed路由策略"),
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _itemButton('语法糖', MyApp.Router_DemoGrammarSugar),
            _itemButton('页面跳转', MyApp.Router_DemoNavigation),
            // _itemButton("手势监听", "gesture"),
            // _itemButton("图片加载（静态图、gif）", "imagetest"),
            // _itemButton("网络请求测试", "network_test"),
            // _itemButton("录音测试", "record_page"),
            // _itemButton("自定义视图-圆形进度条", "circle_progress"),
            // _itemButton("native通信-methodcall", "MethodCallPage")
            // _itemButton("plugin demo", PluginUse(), "plugin"),
            // _itemButton("lessGroup demo", LessGroupWidget(), "lessGroup"),
            // _itemButton(
            //     "statefulGroup demo", StatefulGroupWidget(), "statefulGroup"),
            // _itemButton(
            //     "flutterLayout demo", FlutterLayoutPage(), "flutterLayout"),
            // _itemButton("listviewtest", ListViewTest(), "listviewtest"),
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
            showNavigationDialog(MyApp.Router_DemoNavigation);
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

}
