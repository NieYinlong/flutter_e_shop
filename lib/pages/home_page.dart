
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../config/service_method.dart';
import 'package:convert/convert.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

//  Widget _bannberWidget = FutureBuilder(
//    future: getHomeBanner(),
//    builder: (BuildContext context, AsyncSnapshot snapshot){
//      switch (snapshot.connectionState) {
//        case ConnectionState.none:
//          print('还没有开始网络请求');
//          return Text('还没有开始网络请求');//, style: TextStyle(fontSize: ScreenUtil().setSp(32)));
//        case ConnectionState.active:
//          print('active');
//          return Text('ConnectionState.active');
//        case ConnectionState.waiting:
//          print('waiting');
//          return Center(
//            child: CircularProgressIndicator(),
//          );
//        case ConnectionState.done:
//          print('done');
//          if (snapshot.hasError) return Text('Error: ${snapshot.error}', style: TextStyle(fontSize: ScreenUtil().setSp(32)),);
//
//          List banners = snapshot.data;
//          return SwiperWidget(dataList: banners);
//        default:
//          return null;
//      }
//    },
//  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('首页')),
      body: FutureBuilder(
        future: getHomePageData(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              print('还没有开始网络请求');
              return Text('还没有开始网络请求');//, style: TextStyle(fontSize: ScreenUtil().setSp(32)));
            case ConnectionState.active:
              print('active');
              return Text('ConnectionState.active');
            case ConnectionState.waiting:
              print('waiting');
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              if (snapshot.hasError) return Text('Error: ${snapshot.error}', style: TextStyle(fontSize: ScreenUtil().setSp(32)),);
              var data = snapshot.data['data'];
              return Column(
                children: <Widget>[
                  SwiperWidget(dataList: data['banners']),
                  NavCategory(categoryList: data['nav_categories'],),
                  Text('ss')
                ],
              );
            default:
              return null;
          }
        },
      )
    );
  }
}

// 首页轮播组件
class SwiperWidget extends StatelessWidget {

  final List dataList;
  SwiperWidget({this.dataList}); // 构造函数

  @override
  Widget build(BuildContext context) {

    return Container(
      height: ScreenUtil().setHeight(222),
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          var model = dataList[index];
          return Image.network(model['image']);
        },
        pagination: SwiperPagination(),
        itemCount: dataList.length,
        autoplay: true,
      ),
    );
  }
}

class NavCategory extends StatelessWidget {

  final List categoryList;
  NavCategory({Key key, this.categoryList}):super(key: key);

  Widget _grideViewItem(BuildContext context, item) {
    return InkWell(
      onTap: () {
        print('点击了 ${item['title']} url=${item['link_url']}');
      },
      child: Column(
        children: <Widget>[
          Image.network(item['image'], width: ScreenUtil().setWidth(94)),
          Text(item['title']),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(310),
      padding: EdgeInsets.all(3),
      child: GridView.count(
        crossAxisCount: 5,
        padding: EdgeInsets.all(4),
        children: categoryList.map((item) {
          return _grideViewItem(context, item);
        }).toList(),
      )
    );
  }
}



