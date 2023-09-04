import 'food.dart';
import 'package:flutter/material.dart';
class Shop extends ChangeNotifier {
  final List<Food> _foodMenu = [
    Food(
        name: 'Salmon Sushi',
        price: "21.99",
        imagePath: "lib/images/susu.png",
        rating: "4.7"),
    Food(
      name: 'Tuna',
      price: "19.99",
      imagePath: "lib/images/roll.png",
      rating: "4.8",
    ),

  ];
  List<Food> _cart = [];

  List<Food> get foodMenu => _foodMenu;

  List<Food> get cart => _cart;

  void addtoCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  void removefromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}

