import 'package:flutter/material.dart';

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