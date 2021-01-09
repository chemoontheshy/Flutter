import 'dart:developer';

import 'package:flutter/material.dart';
import 'listData.dart';

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
        body: ListViewBuilderContent(),
      ),
      theme: ThemeData(primarySwatch: Colors.yellow),
    );
  }
}

/// 1.1 基本：组成分析
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

/// 1.1 基本：Container,Text样式
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

/// 2.1 图片：加载图片network,asset
class ImageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Center(
        child: Container(
          //1.显示图片
          // child: Image.network(
          //   "https://s2.ax1x.com/2019/06/23/Z9jRNd.jpg",
          //   //alignment: Alignment.topLeft,
          //   //color: Colors.blue,
          //   //对比色
          //   //colorBlendMode: BlendMode.screen,
          //   //覆盖拉伸
          //   //fit: BoxFit.cover,
          //   //repeat: ImageRepeat.repeatY,
          // ),
          width: 300.0,
          height: 300.0,
          decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(150),
              image: DecorationImage(
                  image: NetworkImage(
                      "https://s2.ax1x.com/2019/06/23/Z9jRNd.jpg"))),
        ),
      );
}

/// 2.2 图片：flutter的CilpOval用法
class CilpOvalContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Center(
        child: Container(
          child: ClipOval(
            child: Image.network(
              "https://s2.ax1x.com/2019/06/23/Z9jRNd.jpg",
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
}

/// 3.1 列表：scrollDirection
class ListViewContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
      height: 180,
      child: ListView(
        padding: EdgeInsets.all(10),
        scrollDirection: Axis.horizontal,
        // children: [
        //   ListTile(
        //     leading: Icon(
        //       Icons.home,
        //       color: Colors.red,
        //     ),
        //     title: Text("一级标题"),
        //     subtitle: Text("二级标题"),
        //   )
        // ],
        children: [
          Container(
            width: 180,
            height: 180,
            color: Colors.red,
          ),
          Container(
            width: 180,
            height: 180,
            color: Colors.green,
          ),
          Container(
            width: 180,
            height: 180,
            color: Colors.blue,
          ),
          Container(
            width: 180,
            height: 180,
            color: Colors.deepOrange,
          ),
          Container(
            width: 180,
            height: 180,
            color: Colors.pink,
          ),
          Container(
            width: 180,
            height: 180,
            color: Colors.purple,
          ),
        ],
      ));
}

/// 3.2 列表：动态列表
class DynamicListContent extends StatelessWidget {
  //自定义方法
  List<Widget> _getData() {
    List<Widget> mylist = new List();
    for (var i = 0; i < 20; i++) {
      mylist.add(ListTile(
        title: Text(" i am $i list"),
      ));
    }
    return mylist;
  }

  @override
  Widget build(BuildContext context) => Container(
        child: ListView(
          children: this._getData(),
        ),
      );
}

/// 3.3 列表：动态循环，传统方式
class GetListContent extends StatelessWidget {
  List<Widget> _getData() {
    var tempList = listData.map((value) => ListTile(
          leading: Image.network(value["imageUrl"]),
          title: Text(value["title"]),
          subtitle: Text(value["author"]),
        ));
    return tempList.toList();
  }

  @override
  Widget build(BuildContext context) => Container(
        child: ListView(
          children: _getData(),
        ),
      );
}

/// 3.4列表：动态循环，flutter的listView.builder用法
class ListViewBuilderContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        child: ListView.builder(
          itemCount: listData.length,
          itemBuilder: (context, index) => ListTile(
            leading: Image.network(listData[index]["imageUrl"]),
            title: Text(listData[index]["title"]),
            subtitle: Text(listData[index]["author"]),
          ),
        ),
      );
}

/// 4.1 网格布局：GridView.count
/// 4.2 网格布局：GridView.Builder
