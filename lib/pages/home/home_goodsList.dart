import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_e_shop/config/service_method.dart';
import '../../config/service_url.dart';

class HotSaleGoodsList extends StatefulWidget {
  @override
  _HotSaleGoodsListState createState() => _HotSaleGoodsListState();
}

class _HotSaleGoodsListState extends State<HotSaleGoodsList> {


  @override
  void initState() {
    super.initState();
    requestGET(servicePath['hotSale'], {'page': 1}).then((value) {
      print('🐶' + value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('2fdhjsklaf '),
    );
  }
}