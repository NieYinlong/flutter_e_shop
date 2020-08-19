import 'package:flutter/material.dart';
import '../model/category_model.dart';

class SubCategory with ChangeNotifier {
  
  List<SubTypeModel> subCategoryList = [];

  getSubCategory(List<SubTypeModel> list) {

    // 自定义一个全部
    SubTypeModel allModel = SubTypeModel();
    allModel.subName = '全部';
    subCategoryList = [allModel];
    subCategoryList.addAll(list);
    // 自定义一个全部 end

    // subCategoryList = list;
    notifyListeners();
  }
}