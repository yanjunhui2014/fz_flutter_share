import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///自定义画笔
class CircleProgressPainter extends CustomPainter {
  final Color borderColor;
  final double borderWidth;

  final double maxValue;
  final double curValue;

  final double width;
  final double height;

  late Paint mPaint;

  final PI = 3.1415926; //flutter中 ， PI = 180（android）

  CircleProgressPainter(this.maxValue, this.curValue, this.borderColor,
      this.borderWidth, this.width, this.height)
      : super() {
    this.mPaint = Paint();
    this.mPaint.strokeWidth = borderWidth;
    this.mPaint.color = borderColor;
    this.mPaint.style = PaintingStyle.stroke;
    this.mPaint.isAntiAlias = true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromLTRB(0, 0, width, height);

    double percent = 0;
    if (maxValue != 0) {
      percent = min(curValue / maxValue, 1.0);
    }

    canvas.drawArc(rect, PI * 1.5, (2 * PI) * percent, false, mPaint);//矩形内绘制圆弧，与android不同的是，android绘制圆弧所需角度为180，flutter为3.1415926，其他几乎一致
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
