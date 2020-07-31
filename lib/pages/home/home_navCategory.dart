import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

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
