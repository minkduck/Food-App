import 'dart:convert';
import 'dart:math';

import 'package:food_delivery/utils/app_constraints.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/cart_model.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});

  List<String> cart = [];
  List<String> cartHistory = [];

  void addToCartList(List<CartModel> cartList) {
    // sharedPreferences.remove(AppConstrants.CART_LIST);
    // sharedPreferences.remove(AppConstrants.CART_HISTORY_LIST);
    var time = DateTime.now().toString();
    cart = [];
    /*
    convert objects to string because sharedPreferences only accepts string
     */
    cartList.forEach((element) {
      element.time = time;
      return cart.add(jsonEncode(element));
    });

    sharedPreferences.setStringList(AppConstrants.CART_LIST, cart);
    // print(sharedPreferences.getStringList(AppConstrants.CART_LIST));
    getCartList();
  }

  List<CartModel> getCartList() {
    List<String> carts = [];
    if (sharedPreferences.containsKey(AppConstrants.CART_LIST)) {
      carts = sharedPreferences.getStringList(AppConstrants.CART_LIST)!;
      // print('inside getCartList ' + carts.toString());
    }
    List<CartModel> cartList = [];

    carts.forEach(
        (element) => cartList.add(CartModel.fromJson(jsonDecode(element))));

    return cartList;
  }

  List<CartModel> getCartHistoryList() {
    if (sharedPreferences.containsKey(AppConstrants.CART_HISTORY_LIST)) {
      // cartHistory = [];
      cartHistory =
      sharedPreferences.getStringList(AppConstrants.CART_HISTORY_LIST)!;
    }
    List<CartModel> cartListHistory = [];

    cartHistory.forEach((element) => cartListHistory.add(CartModel.fromJson(jsonDecode(element))));
    return cartListHistory;
  }
  void addToCartHistoryList() {
    if(sharedPreferences.containsKey(AppConstrants.CART_HISTORY_LIST)){
      cartHistory = sharedPreferences.getStringList(AppConstrants.CART_HISTORY_LIST)!;
    }
    for (int i = 0; i < cart.length; i++) {
      print("history list: " + cart[i]);
      cartHistory.add(cart[i]);
    }
    removeCart();
    sharedPreferences.setStringList(
        AppConstrants.CART_HISTORY_LIST, cartHistory);
    print("the length of history list is " + getCartHistoryList().length.toString());
  }

  void removeCart() {
    cart = [];
    sharedPreferences.remove(AppConstrants.CART_LIST);
  }
}
