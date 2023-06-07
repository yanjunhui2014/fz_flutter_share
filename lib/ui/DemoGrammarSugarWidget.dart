import 'package:ShareDemo/data/bean/GrammarSugarPeople.dart';
import 'package:flutter/material.dart';

///语法糖展示demo
class DemoGrammarSugarWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DemoGrammarSugarState();
  }
}

class DemoGrammarSugarState extends State {
  // GrammarSugarPeople _people = null;
  GrammarSugarPeople _people = new GrammarSugarPeople()
    ..userName = 'LiLei'
    ..age = '100'
    ..sign = 'Hello HanMeiMei';

  Map map = {
    'userName': 'Milo',
    'age': '18',
    'sign': '我帅故我在',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("语法糖"),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Text('人物信息1'),
              item("名字", map['userName']),
              item("年龄", map['age']),
              item("签名", map['sign']),
              Container(
                width: 100,
                height: 100,
              ),
              Text(
                '人物信息2',
              ),
              item("名字", _people?.userName),
              item("年龄", _people?.age),
              item("签名", _people?.sign),
            ],
          ),
        ));
  }

  item(String key, String? value) {
    return Row(
      children: <Widget>[Text(key + ":"), Text(value ?? '暂无')],
    );
  }
}

// step0: 正常运行
// step1: 去掉 line45 的 ?. 给大家看报错信息, 并讲解为什么会报错，讲解 ?. 的作用
// step2: 修改 line21 的 age 值为 null, 得到年龄：暂无，并讲解语法糖 ?? 的作用
// step3: 打开 line14-17 的 _people 实例， 并语法糖 '..' 的作用

