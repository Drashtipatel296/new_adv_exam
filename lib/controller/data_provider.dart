// import 'dart:convert';
// import 'dart:developer';
//
// import 'package:flutter/material.dart';
//
// import '../helper/api_service.dart';
// import '../model/data_model.dart';
//
// class ApiProvider extends ChangeNotifier{
//   DataModel? data;
//   bool isLoading = false;
//
//   Future<void> fetchData() async {
//
//     isLoading = true;
//     notifyListeners();
//
//     String? json = await ApiService().apiCalling();
//     if(json != null){
//       data = DataModel.fromJson(jsonDecode(json));
//     }
//     else{
//       log('------------ null ------------');
//     }
//
//     isLoading = false;
//     notifyListeners();
//   }
//
//   ApiProvider(){
//     fetchData();
//   }
// }

import 'package:flutter/material.dart';
import '../model/data_model.dart';

class DataProvider extends ChangeNotifier {
  List<DataModel> dataModelList = [];

  void setData(List<dynamic> data) {
    dataModelList = DataModel.fromJsonList(data);
    notifyListeners();
  }
}
