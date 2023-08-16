import 'package:flutter/material.dart';
import 'package:vresto/models/food.dart';

class FoodList extends ChangeNotifier {
  final foodMenu = [
    Food(
      name: 'Chicken Biryani',
      price: '399',
      imagePath: 'lib/images/biryani.jpg',
      rating: '4.8',
      description:
          "Indulge your senses in the exquisite flavors of our Chicken Biryani, a culinary masterpiece that combines fragrant basmati rice, tender marinated chicken, and a symphony of aromatic spices. Our time-honored recipe is a harmonious blend of tradition and innovation, meticulously crafted to transport you to the heart of authentic Indian cuisine.",
    ),
    Food(
      name: 'Chicken Lollipop',
      price: '299',
      imagePath: 'lib/images/lollipop.jpg',
      rating: '4.7',
      description: "",
    ),
  ];

  final _cart = [];

  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  void removeFromCart(Food foodItem) {
    _cart.remove(foodItem);
    notifyListeners();
  }

  int totalAmount() {
    int total = 0;
    for (int i = 0; i < _cart.length; i++) {
      total += int.parse(_cart[i].price);
    }
    return total;
  }

  List<Food> get foodList => foodMenu;
  List get cartList => _cart;
}
