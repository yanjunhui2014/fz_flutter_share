import 'package:ShareDemo/data/bean/joke_bean_entity.dart';
import 'package:ShareDemo/net/net_callback.dart';
import 'package:ShareDemo/net/net_manager.dart';
import 'package:flutter/material.dart';

class DemoNetworkWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DemoNetworkState();
  }
}

class DemoNetworkState extends State<DemoNetworkWidget> {
  var text = "It`s empty now";
  var count = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("NetWorkTest"),
        ),
        body: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                RaisedButton(
                    child: Text("请求数据"),
                    onPressed: () {
                      doGetByNetManager();
                    }),
              ],
            ),
            Text(text)
          ],
        ),
      ),
    );
  }

  void doGetByNetManager() {
    NetManager.instance.queryJokeData(new NetCallback<JokeBeanResult>(
        onSuccess: (JokeBeanResult response) {
          setState(() {
            text = response.data[count++ % 10].content;
          });
        },
        onFail: (Exception e) {}));
  }
}
