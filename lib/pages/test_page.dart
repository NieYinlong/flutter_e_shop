import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import '../config/service_url.dart';
import '../config/service_method.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  List list = [];
  int page = 1;
  EasyRefreshController _controller;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
  }

  Widget itemWidget(item) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Row(
        children: [
          Image.network(item['img'], width: 80,),
          Text(item['des'])
        ]
      ),
    );
  }

  loadNewData() {
    page = 1;
    reqForList();
  }

  loadMoreData() {
    page++;
    reqForList();
  }

  reqForList() {
    requestGET(API.HOT_SALE, null).then((value) {
      if(page == 1) {
        list = [];
      }
      list.addAll(value['data']['items']);
      _controller.finishRefresh();
      _controller.finishLoad(noMore: list.length > 20);
      // 更新组件
      setState(() {
        list = list;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('测试页')),
      body: Center(
        child: 
        
        EasyRefresh.custom(
          enableControlFinishLoad: true,
          enableControlFinishRefresh: true,
          controller: _controller,
          onRefresh: () async {
            loadNewData();
          },
          onLoad: () async {
            loadMoreData();
          },
          slivers: <Widget>[
            SliverList(
                delegate: SliverChildBuilderDelegate(
              (context, index) {
                return itemWidget(list[index]);
              },
              childCount: list.length,
            )),
          ],
        ),
      ),
    );
  }

  Widget listWidget() {
    return EasyRefresh(
      controller: _controller,

      onRefresh: loadNewData(),

      onLoad:loadMoreData(),

      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return itemWidget(list[index]);
        }
      )
     
    );
  }
}