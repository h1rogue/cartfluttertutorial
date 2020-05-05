import 'package:cartflutter/Screens/home.dart';
import 'package:cartflutter/Screens/secondpage.dart';
import 'package:cartflutter/model/Listitem.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class MyCart extends ChangeNotifier {
  final List<Listitem> _cartlist = [];

  List<Listitem> get cartlist => _cartlist;

  void add_to_cart(item) {
    cartlist.add(item);
    notifyListeners();
  }

  void remove_from_cart(item) {
    cartlist.remove(item);
    notifyListeners();
  }

  int total_price() {
    int total = 0;
    for (var item in cartlist) {
      total += item.Value;
    }
    return total;
  }
}

class PageProv extends ChangeNotifier {
  int _selectedpage = 0;

  int get selectedpage => _selectedpage;

  void changePage(int ind) {
    _selectedpage = ind;
    notifyListeners();
  }
}
