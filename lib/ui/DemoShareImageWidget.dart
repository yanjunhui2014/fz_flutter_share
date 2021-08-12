import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DemoShowImageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DemoShowImageState();
}

class DemoShowImageState extends State<DemoShowImageWidget> {
  static const viewType = "com.milo.flutterapp.flutter/flutterimageview";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("图片显示demo")),
      body: Container(
        child: Column(
          children: <Widget>[
            Image.network(
              "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Ftyzg.ys1.cnliveimg.com%2F577%2Fimg%2F2020%2F0604%2F200604223859816_938.jpeg%40base%40tag%3DimgScale%26q%3D20&refer=http%3A%2F%2Ftyzg.ys1.cnliveimg.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1631328749&t=160e498ec00f4fcd9d9f0f79f4d91dfc",
              width: 240,
              height: 200,
            ),
            Text("flutter加载的图片"),
            Container(
              width: 240,
              height: 200,
              child: AndroidView(
                  viewType: viewType,
                  creationParamsCodec: StandardMessageCodec(),
                  creationParams: {
                    "url":
                        "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.dazijia.com%2FUploads%2Fxianlu%2F20170925%2F59c9240818995.jpg%21%2Ffwfh%2F1024x634%2Fclip%2F1024x634a1024a634&refer=http%3A%2F%2Fimg.dazijia.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1631329119&t=6975e2771ad41ce16e305ece68deb3e6"
                  }),
            ),
            Text("android源生加载的图片"),
          ],
        ),
      ),
    );
  }
}
