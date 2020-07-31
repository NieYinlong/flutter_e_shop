import 'package:flutter/material.dart';
import 'package:flutter_e_shop/config/service_method.dart';
import 'package:flutter_e_shop/consts.dart';
import 'package:flutter_screenutil/screenutil.dart';
import '../../config/service_url.dart';

class HotSaleGoodsList extends StatefulWidget {
  @override
  _HotSaleGoodsListState createState() => _HotSaleGoodsListState();
}

class _HotSaleGoodsListState extends State<HotSaleGoodsList> {
  
  int page = 1;
  List goodsList = [];

  @override
  void initState() {
    super.initState();
    requestHotSale();
  }

  void requestHotSale() {
    requestGET(API.HOT_SALE, null).then((value) {
      List list = value['data']['items'];
      setState(() {
        goodsList.addAll(list);
        page++;
      });
    });
  }

  Widget _hotSaleTitle = Container(
      width: ScreenUtil.screenWidth,
      color: Color(0xFFCBCBCB),
      padding: EdgeInsets.only(top: 8, bottom: 8),
      child: Text('热卖', textAlign: TextAlign.center, style: TextStyle(color: AppColors.ThemeColor, fontSize: ScreenUtil().setSp(36)),),
  );


  // Widget _listWidget() {
  //   Widget content;

  //   List<Widget> list = [];
  //   for (var item in goodsList) {
  //     list.add(Image.network(
  //       item['img'],
  //       width: ScreenUtil.screenWidth / 2.5,
  //     ));
  //   }

  //   content = Column(children: list);

  //   return Wrap(
  //     spacing: 2,
  //     children: list,
  //   );
  // }

  Widget _wrapList() {
    if(goodsList.length == 0) {
      return Container(child: Text('暂无数据'));
    }

    List<Widget> listWidg = goodsList.map((e) {
      
      print('WIDTH = ${ScreenUtil().setWidth(1080)}');
      return InkWell(
        onTap: (){},
        child: Container(
          width: ScreenUtil.screenWidth / 2,
          // color: Colors.yellowAccent,
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
      // spacing: 10, // 间隔
      children: listWidg,
    );    
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _hotSaleTitle,
        _wrapList(),
        // _listWidget(),
      ],
    );
  }
}
