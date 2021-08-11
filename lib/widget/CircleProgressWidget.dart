import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'CircleProgressPainter.dart';

///录音中圆形进度视图
class CircleProgressWidget extends StatefulWidget {
  static Color mDesignColor = Color(0xffFFDA32); //我们设计给的色值

  final Color borderColor;
  final double borderWidth;

  final double maxValue;
  final double curValue;

  final double width;
  final double height;

  ///[maxValue] - 不可以传 null， 否则会引起异常
  ///[curValue] - 不可以传 null， 否则会引起异常
  CircleProgressWidget(this.maxValue, this.curValue,
      {this.borderColor = Colors.yellow,
      this.borderWidth = 5,
      this.width = 55,
      this.height = 55})
      : super();

  @override
  State<StatefulWidget> createState() {
    return CircleProgressState();
  }
}

class CircleProgressState extends State<CircleProgressWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: CustomPaint(
        painter: CircleProgressPainter(
            widget.maxValue,
            widget.curValue,
            widget.borderColor,
            widget.borderWidth,
            widget.width,
            widget.height),
      ),
    );
  }
}
