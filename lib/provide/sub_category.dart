import 'package:flutter/material.dart';
import '../model/category_model.dart';

class SubCategory with ChangeNotifier {
  
  List<SubCategoryModel> subCategoryList = [];

  getSubCategory(List<SubCategoryModel> list) {

    // 自定义一个全部
    SubCategoryModel allModel = SubCategoryModel();
    allModel.subName = '全部';
    subCategoryList = [allModel];
    subCategoryList.addAll(list);
    // 自定义一个全部 end

    // subCategoryList = list;
    notifyListeners();
  }
}