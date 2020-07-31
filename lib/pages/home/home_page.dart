import 'package:flutter/material.dart';

import 'package:flutter_easyrefresh/easy_refresh.dart';
import '../../config/service_method.dart';
import '../../config/service_url.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './home_recommend.dart' show Recommend;
import './home_goodsList.dart' show HotSaleGoodsList;
import './home_swiper.dart';
import './home_navCategory.dart';
import './home_ad.dart' show BannerAd;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

// with AutomaticKeepAliveClientMixin
class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('首页')),
        body: FutureBuilder(
          future: requestGET(API.HOME_DATA, null),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                print('还没有开始网络请求');
                return Text(
                    '还没有开始网络请求'); //, style: TextStyle(fontSize: ScreenUtil().setSp(32)));
              case ConnectionState.active:
                print('active');
                return Text('ConnectionState.active');
              case ConnectionState.waiting:
                print('waiting');
                return Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.done:
                if (snapshot.hasError)
                  return Text(
                    'Error: ${snapshot.error}',
                    style: TextStyle(fontSize: ScreenUtil().setSp(32)),
                  );
                var data = snapshot.data['data'];

                // SingleChildScrollView 可以自动滚动
                return SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        SwiperWidget(dataList: data['banners']),
                        NavCategory(categoryList: data['nav_categories']),
                        BannerAd(),
                        Recommend(recommendList: data['recommend']),
                        HotSaleGoodsList(),
                        Text('待开发'),
                    ],
                ));

              default:
                return null;
            }
          },
        ));
  }
}
