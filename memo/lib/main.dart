import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Memo'),
        ),
        body: ImageContent(),
      ),
      theme: ThemeData(primarySwatch: Colors.yellow),
    );
  }
}

class HomeCenter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'hello memo',
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontSize: 40.0,
          color: Colors.blueAccent,
          // color: Color.fromRGBO(233,23,323,0.3)
        ),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Center(
          child: Container(
        child: Text(
          "test",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 32.0, color: Colors.red),
        ),
        height: 300.0,
        width: 300.0,
        decoration: BoxDecoration(
            color: Colors.yellow,
            border: Border.all(color: Colors.red, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        // 外边距
        //margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
        //旋转
        // transform: Matrix4.rotationX(0.3),
        // 放大
        //transform: Matrix4.diagonal3Values(x, y, z),

        //控件位置
        //alignment: Alignment.bottomCenter,
      ));
}

class ImageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Center(
        child: Container(
          child: Image.network(
            "https://s2.ax1x.com/2019/06/23/Z9jRNd.jpg",
            alignment: Alignment.topLeft,
            //color: Colors.blue,
            //colorBlendMode: BlendMode.screen,
            fit: BoxFit.cover,
          ),
          width: 300.0,
          height: 300.0,
          decoration: BoxDecoration(
            color: Colors.yellow,
          ),
        ),
      );
}
