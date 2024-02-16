import 'package:demo_app/models/customer.models.dart';
import 'package:flutter/material.dart';

class CustomerViewModel extends ChangeNotifier {
  final List<CustomerDataModel> _dataList = [];

  List<CustomerDataModel> get dataList => _dataList;

  void addCustomer(CustomerDataModel req) async {
    _dataList.add(req);
    notifyListeners();
  }

  void editCustomer(CustomerDataModel req) async {
    _dataList.add(req);
    notifyListeners();
  }

  void deleteCustomer(CustomerDataModel req) async {
    _dataList.remove(req);
    notifyListeners();
  }
}
