import 'package:dio/dio.dart';
import 'dart:async';
import 'service_url.dart';

enum HTTPMethod
{
  GET,
  POST,
  DELETE,
  PUT,
}
  Future getUserInfo() async {
    Response rsp = await Dio().get(API.HOT_SALE);
    return rsp.data;
  }

Future requestGET(url, param) async {
   return request(url, param, HTTPMethod.GET);
}

Future requestPOST(url, param) async {
  return request(url, param, HTTPMethod.POST);
}

Future requestPUT(url, param) async {
  return request(url, param, HTTPMethod.PUT);
}

Future request(String url, param, HTTPMethod medhod) async 
{ 
   try{
    Dio dio = new Dio();
    Response rsp;
    if(medhod == HTTPMethod.GET) {
     rsp = await dio.get(url, queryParameters: param);
    } 
    else if(medhod == HTTPMethod.POST) {
      rsp = await dio.post(url, queryParameters: param);
    } 
    else if(medhod == HTTPMethod.PUT) {
      rsp = await dio.put(url, queryParameters: param);
    }
    else if(medhod == HTTPMethod.DELETE) {
      rsp = await dio.delete(url, queryParameters: param);
    }
    if(rsp.statusCode == 200) {
      print('${url}url result=${rsp}');
      return rsp.data;
    } else {
      throw Exception('接口异常');
    }
  } catch(e) {
    return print('NYL_ERROR =======> : $e');
  }
}




// Future requestPOST(url, param) async {
  // print('请求地址 ==> : ${servicePath['hotSale']}');
  // try{
  //   Dio dio = new Dio();
  //   Response rsp = await dio.post(url, queryParameters: param);
  //   if(rsp.statusCode == 200) {
  //     return rsp.data;
  //   } else {
  //     throw Exception('接口异常');
  //   }

  // } catch(e) {

  //   return print('NYL_ERROR =======> : $e');
  // }
// }

/* 00000  以下废弃     00000000*/
// Future getHomeBanner() async {
//   print('请求地址 ==> : ${servicePath['homeBanner']}');
//   try{
//     Dio dio = new Dio();
//     Response rsp = await dio.get(servicePath['homeBanner']);
//     if(rsp.statusCode == 200) {
//       return rsp.data;
//     } else {
//       throw Exception('接口异常');
//     }

//   } catch(e) {

//     return print('NYL_ERROR =======> : $e');
//   }
// }

// getHomePageData() async {
//   print('请求地址 ==> : ${servicePath['homeData']}');
//   try{
//     Dio dio = new Dio();
//     Response rsp = await dio.get(servicePath['homeData']);
//     if(rsp.statusCode == 200) {
//       return rsp.data;
//     } else {
//       throw Exception('接口异常');
//     }

//   } catch(e) {

//     return print('NYL_ERROR =======> : $e');
//   }
// }

// Future getHotSaleData() async {
//   print('请求地址 ==> : ${servicePath['hotSale']}');
//   try{
//     Dio dio = new Dio();
//     Response rsp = await dio.get(servicePath['hotSale']);
//     if(rsp.statusCode == 200) {
//       return rsp.data;
//     } else {
//       throw Exception('接口异常');
//     }

//   } catch(e) {

//     return print('NYL_ERROR =======> : $e');
//   }
// }
