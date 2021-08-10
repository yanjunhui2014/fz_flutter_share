import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///Anim演示
class DemoAnimWidget extends StatefulWidget {
  static const int type_gif = 1;
  static const int type_lottie = 2;
  static const int type_system = 3;

  final int type;

  DemoAnimWidget(this.type);

  @override
  State<StatefulWidget> createState() {
    if (type == type_gif) {
      return DemoAnimGifState();
    }
    return null;
  }
}

///动画-gif演示
class DemoAnimGifState extends State<DemoAnimWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GIF动画")),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/gif/after_class_home_anim_cartoon.gif",
              width: 150,
              height: 150,
            ),
            Text("正常gif"),
            Image.asset(
              "assets/gif/game_pic_match_take_right.gif",
              width: 150,
              height: 150,
            ),
            Text("异常gif")
          ],
        ),
      ),
    );
  }
}
