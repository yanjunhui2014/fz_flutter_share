import 'package:ShareDemo/utils/FZLog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
    } else if (type == type_lottie) {
      return DemoAnimLottieState();
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

class DemoAnimLottieState extends State<DemoAnimWidget>
    with TickerProviderStateMixin {
  AnimationController _lottieController;

  @override
  void initState() {
    _lottieController = AnimationController(vsync: this)
      ..value = 0.0
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed ||
            status == AnimationStatus.dismissed) {
          FZLog.d('lottie 动画结束了');
          _lottieController.forward(from: 0.001);
        }
      });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lottie动画")),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Lottie.asset(
              'assets/lottie/game_river_correct.json',
              height: MediaQuery.of(context).size.width * 275 / 750,
              width: MediaQuery.of(context).size.width * 271 / 750,
              repeat: false,
              fit: BoxFit.cover,
              controller: _lottieController,
              onLoaded: (composition) {
                setState(() {
                  _lottieController.value = 0.0;
                  _lottieController.duration = composition.duration;
                  _lottieController.forward(from: 0.001);
                });
              },
            ),
            Lottie.asset(
              'assets/lottie/game_river_jump.json',
              height: MediaQuery.of(context).size.width * 275 / 750,
              width: MediaQuery.of(context).size.width * 271 / 750,
              repeat: false,
              fit: BoxFit.cover,
              controller: _lottieController,
            ),
            Lottie.asset(
              'assets/lottie/game_result_excellent.json',
              height: MediaQuery.of(context).size.width * 275 / 750,
              width: MediaQuery.of(context).size.width * 271 / 750,
              repeat: false,
              fit: BoxFit.cover,
              controller: _lottieController,
            ),
          ],
        ),
      ),
    );
  }
}
