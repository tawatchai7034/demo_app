import 'package:demo_app/models/customer.models.dart';
import 'package:flutter/material.dart';

class CustomerViewModel extends ChangeNotifier {
  final List<CustomerDataModel> _dataList = [];

  List<CustomerDataModel> get dataList => _dataList;

  void addCustomer(CustomerDataModel req) async {
    _dataList.add(req);
    notifyListeners();
  }

  void editCustomer(CustomerDataModel old, CustomerDataModel update) async {
    final index = _dataList.indexOf(old);
    _dataList[index] = update;
    notifyListeners();
  }

  void deleteCustomer(CustomerDataModel req) async {
    _dataList.remove(req);
    notifyListeners();
  }

  bool validateCustomer(CustomerDataModel req) {
    bool error = false;
    var data = _dataList.where((element) => element.cId == req.cId);
    if (data.isNotEmpty) {
      error = true;
    }
    return error;
  }
}
