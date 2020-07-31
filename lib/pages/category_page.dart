import 'package:flutter/material.dart';
import 'package:flutter_e_shop/config/service_method.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import '../config/service_url.dart';
import '../config/service_method.dart';

class CategoryPage extends StatelessWidget {
  
  List list = [1, 2, 3, 4, 5, 6, 7, 9 , 10, 11, 12, 13, 14, 15, 16,1, 2, 3, 4, 5, 6, 7, 9 , 10, 11, 12, 13, 14, 15, 16];

  int page = 1;

  Widget itemWidget(item) {
    return Text(
      item,
      style: TextStyle(fontSize: 33),
    );
  }


  loadNewData()
  {
    print('page = ${page}' );
    requestGET(API.HOT_SALE, null).then((value){
      print(value);
    });
  }

  loadMoreData()
  {
    requestGET(API.HOT_SALE, null).then((value){
      print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('分类')),
      body: Center(
          child: EasyRefresh(
        child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return itemWidget(list[index].toString());
            }),
        onRefresh: () async {
          page = 1;
          loadNewData();
        },
        onLoad: () async {
          page++;
          loadMoreData();
        },
      )),
    );
  }
}
