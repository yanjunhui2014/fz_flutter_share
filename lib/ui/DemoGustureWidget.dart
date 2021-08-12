import 'package:ShareDemo/utils/FZLog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///手势学习demo
class DemoGustureWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DemoGustureState();
}

class DemoGustureState extends State<DemoGustureWidget> {
  static const platform =
      MethodChannel('com.milo.flutterapp.flutter/EventBusMethodCallHandler');

  String log = "";
  double moveX = 0;
  double moveY = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("手势学习"),
      ),
      body: FractionallySizedBox(
        widthFactor: 1,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Listener(
                  //监听手指所在组件内部位置，而无需移动组件，直接使用Listener组件即可
                  onPointerMove: (e) => _printLog(
                      //监听 onPointerMove, 并打印出 localPosition 信息
                      "onPointerMove position ==" + e.localPosition.toString()),
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(color: Colors.cyan),
                  ),
                ),
                Container(
                  width: 100,
                  height: 50,
                ),
                GestureDetector(
                  // onTap 时间的监听需要建立在 GestureDetector 组件之上
                  // onTap: () => _printLog("onTab"), //所有onTap都会触发，且与其他事件有200ms的延迟冲突（会导致其他事件200ms内无法接收）
                  //双击
                  onDoubleTap: () => _printLog("onDoubleTap"),
                  //按下
                  onTapDown: (e) => _printLog("onTapDown x == " +
                      e.globalPosition.dx.toString() +
                      ", y == " +
                      e.globalPosition.dy.toString()),
                  //抬起
                  onTapUp: (e) => _printLog("onTapUp x == " +
                      e.globalPosition.dx.toString() +
                      ", y == " +
                      e.globalPosition.dy.toString()),
                  //长按
                  onLongPress: () => _printLog("onLongPress"),
                  //取消
                  onTapCancel: () => _printLog("onTapCancel"),
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(color: Colors.purple),
                  ),
                ),
                Container(margin: EdgeInsets.only(top: 20), child: Text(log))
              ],
            ),
            Positioned(
              left: moveX,
              top: moveY,
              child: GestureDetector(
                //使用GestureDetector作为Positioned的一级child
                onPanUpdate: (e) => _doMove(e.delta.dx, e.delta.dy),
                // 根据手势改变位置，通过 DragUpdateDetails.detail.dx/dy 改变view 的位置，外层需要用Positioned（定位组件）嵌套
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(360))),
                  width: 70,
                  height: 70,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _printLog(String log) {
    setState(() {
      this.log = log;
    });

    invokeMethod("click");
  }

  _doMove(x, y) {
    setState(() {
      moveX += x;
      moveY += y;
    });

    invokeMethod("move");
  }

  void invokeMethod(String event) async {
    try {
      String result = await platform.invokeMethod(event);
      if ("success" == result) {
        FZLog.d("事件记录");
      } else {
        FZLog.d("事件没有被记录");
      }
    } on PlatformException catch (e) {}
  }
}

// step0 : 展示效果
// step1 : 介绍红圈为拖动效果， 绿色区域为监听内部移动位置， 紫色区域为tab事件的集合
// step2 : 将备注的事件一一介绍
