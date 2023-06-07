import 'package:ShareDemo/utils/Utils.dart';
import 'package:flutter/material.dart';

typedef SimpleDialogOnClickListener = void Function(int event);

class FZSimpleDialog extends Dialog {
  static const EVENT_CANCEL = 1;
  static const EVENT_CONFIRM = 2;

  static const portrait = 1;
  static const landscape = 2;

  final String mTitle;
  final String mMsg;
  final String mCancel;
  final String mConfirm;
  final int orientation;

  final SimpleDialogOnClickListener mOnClickListener;

  const FZSimpleDialog(this.mTitle, this.mMsg,
      {required Key key,
        required this.mOnClickListener,
      this.mCancel = "取消",
      this.mConfirm = "确定",
      this.orientation = portrait})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = 0.0;
    if (orientation == portrait) {
      height = Utils.getInstance().getScreenWidth(context) * 184.0 / 375;
    } else {
      height = Utils.getInstance().getScreenHeight(context) * 184.0 / 375;
    }

    var width = height * 1.5;
    var buttonWidth = width * 0.35;
    var buttonHeight = buttonWidth * 0.4;

    return new UnconstrainedBox(
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(mTitle,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black87,
                    decoration: TextDecoration.none)),
            Text(mMsg,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                    decoration: TextDecoration.none)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _cancelButton(context, buttonWidth, buttonHeight),
                _confirmButton(context, buttonWidth, buttonHeight),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _confirmButton(BuildContext context, var itemWidth, var itemHeight) {
    return Listener(
      onPointerUp: (e) {
        Navigator.pop(context);
        if (mOnClickListener != null) {
          mOnClickListener.call(EVENT_CONFIRM);
        }
      },
      child: Container(
        alignment: Alignment.center,
        width: itemWidth,
        height: itemHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          border: Border.all(color: Color(0xff4DD250), width: 1.0),
        ),
        child: Text(
          this.mConfirm,
          style: TextStyle(
              fontSize: 15,
              color: Color(0xff4DD250),
              decoration: TextDecoration.none),
        ),
      ),
    );
  }

  Widget _cancelButton(BuildContext context, var itemWidth, var itemHeight) {
    return Listener(
      onPointerUp: (e) {
        Navigator.pop(context);
        if (mOnClickListener != null) {
          mOnClickListener.call(EVENT_CANCEL);
        }
      },
      child: Container(
        alignment: Alignment.center,
        width: itemWidth,
        height: itemHeight,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            color: Color(0xff4DD250)),
        child: Text(
          this.mCancel,
          style: TextStyle(
              fontSize: 15,
              color: Colors.white,
              decoration: TextDecoration.none),
        ),
      ),
    );
  }
}
