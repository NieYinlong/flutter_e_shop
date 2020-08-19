import 'package:flutter/material.dart';
import 'package:flutter_e_shop/consts.dart';
import 'package:flutter_screenutil/screenutil.dart';

class HotSaleGoodsList extends StatefulWidget {

HotSaleGoodsList({Key key, this.goodsList}) : super(key: key);
  final List goodsList;

  @override
  _HotSaleGoodsListState createState() => _HotSaleGoodsListState();
}

class _HotSaleGoodsListState extends State<HotSaleGoodsList> {
  

  Widget _hotSaleTitle = Container(
      width: ScreenUtil.screenWidth,
      color: AppColors.BgGrayColor,
      padding: EdgeInsets.only(top: 8, bottom: 8),
      child: Text('热卖', textAlign: TextAlign.center, style: TextStyle(color: AppColors.ThemeColor, fontSize: ScreenUtil().setSp(36)),),
  );


  Widget _wrapList(list) {
    
    List goodsList = list;

    if(goodsList.length == 0) {
      return Container(child: Text('暂无数据'));
    }

    List<Widget> listWidg = goodsList.map((e) {
      print('WIDTH = ${ScreenUtil().setWidth(1080)}');
      return InkWell(
        onTap: (){},
        child: Container(
          width: ScreenUtil.screenWidth / 2,
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.only(bottom: 3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // 交叉轴
            children: <Widget>[
              Image.network(e['img']),
              Container(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child: Text('${e['des']}')
              ),
              Text('¥${e['price']}',  style: TextStyle(fontSize: ScreenUtil().setSp(32), color: Colors.redAccent),)
            ],
          ), 
        ),
      );
    }).toList();

    return Wrap(
      children: listWidg,
    );    
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _hotSaleTitle,
        _wrapList(widget.goodsList),
        // _listWidget(),
      ],
    );
  }
}
