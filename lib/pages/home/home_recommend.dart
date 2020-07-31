import 'package:flutter/material.dart';
import 'package:flutter_e_shop/consts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Recommend extends StatelessWidget {
  
  final List recommendList;
  // 构造函数
  Recommend({Key key, this.recommendList}) : super(key: key);

// 推荐标题
  Widget _titleView() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
      decoration: BoxDecoration(
        // color: Colors.red,
        border: Border(bottom: BorderSide(width: 0.4, color: Colors.black26)),
      ),
      child: Text(
        '推荐',
        style: TextStyle(color: AppColors.ThemeColor),
      ),
    );
  }

// 列表中的一个item
  Widget _oneItem(index) {
    var model = recommendList[index];
    print(recommendList);
    return InkWell(
        onTap: () {
          print('object');
        },
        child: Container(
          width: ScreenUtil().setWidth(230),
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(color: Colors.black26, width: 0.4),
          )),
          child: Column(
            children: <Widget>[
              Image.network(model['img']),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 4),
                child: Text('¥${model['price'].toString()}'),
              ),
              Text(
                '¥${model['original_price'].toString()}',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: ScreenUtil().setHeight(15),
                  decoration: TextDecoration.lineThrough,
                ),
              )
            ],
          ),
        ));
  }

// 横向列表
  Widget _listWidget() {
    return Container(
      height: ScreenUtil().setHeight(260),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: recommendList.length,
          itemBuilder: (context, index) {
            return _oneItem(index);
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _titleView(),
          _listWidget(),
        ],
      ),
    );
  }
}
