import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../../config/service_method.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './home_recommend.dart' show Recommend;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

// with AutomaticKeepAliveClientMixin
class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('首页')),
        body: FutureBuilder(
          future: getHomePageData(),
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
                    NavCategory(
                      categoryList: data['nav_categories'],
                    ),
                    BannerAd(),
                    Recommend(recommendList: data['recommend']),
                    Text('待开发'),
                    Text(
                      'fhdsqkfdsqhfhshfjkdsahfjkdsahfjkdsahfjkdslahfjkdsahfjkdsahfjkdsahfjkdslahfjkdsahfjkdsahfjkdsahfjkdslahfjkdashfjkdsahfjdksal',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 66,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ));

              default:
                return null;
            }
          },
        ));
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
        onTap: (index) {
          String linkUrl = dataList[index]['link_url'];
          print('点击了${index} ${linkUrl}');
          // html.window.open();
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

// 商品分类导航
class NavCategory extends StatelessWidget {
  final List categoryList;
  NavCategory({Key key, this.categoryList}) : super(key: key);

  Widget _grideViewItem(BuildContext context, item) {
    // InkWell 有点击效果的小容器组件
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
        //decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.pink)),
        height: ScreenUtil().setHeight(260),
        padding: EdgeInsets.all(3),
        child: GridView.count(
          crossAxisCount: 5,
          padding: EdgeInsets.all(4),
          physics: NeverScrollableScrollPhysics(), // 禁止滚动
          children: categoryList.map((item) {
            return _grideViewItem(context, item);
          }).toList(),
        ));
  }
}

// 广告条
class BannerAd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(
          'https://gw.alicdn.com/imgextra/i1/1632892/O1CN01c1GKev1XEa1uzTYCL_!!1632892-0-lubanu.jpg'),
    );
  }
}

