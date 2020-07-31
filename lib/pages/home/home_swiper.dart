import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

// 首页轮播组件
class SwiperWidget extends StatelessWidget {
  
  final List dataList;
  SwiperWidget({this.dataList}); // 构造函数

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(222),
      child: Swiper(
        onTap: (index) {
          String linkUrl = dataList[index]['link_url'];
          print('点击了${index} ${linkUrl}');
        },
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
