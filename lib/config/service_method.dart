import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import 'service_url.dart';

 getHomePageContent() async {
  print('请求地址 ==> : ${servicePath['homeBanner']}');
  try{
    Dio dio = new Dio();
//    dio.options.contentType = ContentType.parse("application/x-www-form-urlencoded");
    var formData = {'lon' : '115.09090', 'lat': '29.90909'};
    Response rsp = await dio.get(servicePath['homeBanner']);
//    print(rsp);
    if(rsp.statusCode == 200) {
      return rsp.data;
    } else {
      throw Exception('接口异常');
    }

  } catch(e) {

    return print('NYL_ERROR =======> : $e');
  }
}