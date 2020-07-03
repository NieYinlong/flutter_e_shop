import 'dart:convert';

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

  List _bannerList = [];

  void _getBanner () async {
    getHomePageContent().then((data) {
      setState(() {
        print(data);
        _bannerList = data;
      });
    });
  }

  int count = 0;
  @override
  void initState() {
    super.initState();
    print('initState');
//    _getBanner();
  }
  
  Widget _bannberWidget = FutureBuilder(
    future: getHomePageContent(),
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
          print('done');
          if (snapshot.hasError) return Text('Error: ${snapshot.error}', style: TextStyle(fontSize: ScreenUtil().setSp(32)),);
          List banners = snapshot.data;
          return SwiperDiy(swiperDataList: banners);
        default:
          return null;
      }
    },
  );

  @override
  Widget build(BuildContext context) {
    //设置适配尺寸 (填入设计稿中设备的屏幕尺寸) 此处假如设计稿是按iPhone6的尺寸设计的(iPhone6 750*1334)
    ScreenUtil.init(width: 750, height: 1334, allowFontScaling: false);
    print('count = ${count++}');
    return Scaffold(
      appBar: AppBar(title: Text('首页')),
      body: Column(
        children: <Widget>[
          _bannberWidget,
          Text('上面是轮播图', style: TextStyle(fontSize: ScreenUtil().setSp(32)),)
        ],
      ),
    );
  }
}

// 首页轮播组件
class SwiperDiy extends StatelessWidget {

  final List swiperDataList;
  SwiperDiy({this.swiperDataList}); // 构造函数

  @override
  Widget build(BuildContext context) {

    return Container(
      height: ScreenUtil().setHeight(322),
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          var model = swiperDataList[index];
          return Image.network(model['image']);
        },
        pagination: SwiperPagination(),
        itemCount: swiperDataList.length,
        autoplay: true,
      ),
    );
  }
}

//class HomePage extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    getHttp();
//    return Scaffold(
//      appBar: AppBar(title: Text('首页')),
//      body: Center(
//        child: Text('home page'),
//      ),
//    );
//  }
//
//  void getHttp() async {
//    try {
//      Response response;
//      response = await Dio().get('https://3g.163.com/touch/reconstruct/article/list/BA10TA81wangning/0-10.html');
//      print('打印结果: $response');
//    } catch (e) {
//       print(e);
//    }
//  }
//}


//class HomePage extends StatefulWidget {
//  @override
//  _HomePageState createState() => _HomePageState();
//}
//
//class _HomePageState extends State<HomePage> {
//  TextEditingController _editingController = TextEditingController();
//  String _showText = '---';
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      child: Scaffold(
//        appBar: AppBar(title: Text('选择你喜欢的类型'),),
//        body: Container(
//          child: Column(
//            children: <Widget>[
//              TextField(
//                controller: _editingController,
//                decoration: InputDecoration(
//                  contentPadding: EdgeInsets.all(10.0),
//                  labelText: '美女类型',
//                  helperText: '请输入喜欢的类型'
//                ),
//                autofocus: false, // 自动聚焦
//              ),
//              RaisedButton(
//                onPressed: _choiceAction,
//                child: Text('选择e'),
//              ),
//              Text(
//                _showText,
//                overflow: TextOverflow.ellipsis,
//                maxLines: 2,
//                style: TextStyle(color: Color(0xffF74C31)),
//              )
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//
//  void _choiceAction() {
//    print('开始旋转你喜欢的类型w...');
//    if(_editingController.text.toString() == '') {
//      showDialog(
//        context: context,
//        builder: (context) => AlertDialog(title: Text('不能为空'),)
//      );
//    }
//    else {
//      getHttp(_editingController.text.toString()).then((data) {
////        print(data['S1471399123413'].toString());
//        print(data);
//        setState(() {
//            _showText = data.toString();
//        });
//      });
//    }
//
//  }
//
//  Future getHttp(String typeText) async {
//    print('typeText = $typeText');
//    try {
//      Response response = await Dio().get('https://www.fastmock.site/mock/cdd7f4392d9a84bcabda1cdef02cc719/eshop/girl_type',
//        queryParameters: {}
//      );
//
//      return response.data;
//    } catch(e) {
//      print('nyl错误: $e');
//    }
//  }
//}



