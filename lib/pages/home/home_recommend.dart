import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Recommend extends StatelessWidget {
  
  final List recommendList;
  // 构造函数
  Recommend({Key key, this.recommendList}) : super(key: key);

// 推荐标题
  Widget _titleView() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10, 4, 0, 4),
      decoration: BoxDecoration(
        // color: Colors.red,
        border: Border(bottom: BorderSide(width: 0.4, color: Colors.black26)),
      ),
      child: Text(
        '推荐',
        style: TextStyle(color: Colors.orangeAccent),
      ),
    );
  }

// 列表中的一个item
  Widget _oneItem (index) {
    
    var model = recommendList[index];

    print('😁' + model['img']);

    print(recommendList);
    return InkWell(
      onTap: (){print('object');},
      child: Container(
        // height: ScreenUtil().setHeight(330),
        width: ScreenUtil().setWidth(250),
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          border: Border( 
            // right: BorderSide(color: Colors.black26, width: 0.4)
          )
        ),
        child: Column(
          children: <Widget>[
            Image.network(model['img']),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text('¥${model['price'].toString()}'),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text('¥${model['original_price'].toString()}', style: TextStyle(
                color: Colors.grey,
                fontSize: ScreenUtil().setHeight(15),
                decoration: TextDecoration.lineThrough,
              ),),
            )
          ],
        ),
      )
    );
  }

// 横向列表
  Widget _listWidget() {
    return Container(
      height: ScreenUtil().setHeight(330),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recommendList.length,
        itemBuilder: (context, index){
          return _oneItem(index);
        }
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: ScreenUtil().setHeight(380),
      child: Column(
      children: <Widget>[
         _titleView(),
         _listWidget(),
       ],
      ),
    );
  }
}
