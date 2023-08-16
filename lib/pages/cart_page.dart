import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vresto/data/foodlist.dart';
import 'package:vresto/models/food.dart';
import 'package:vresto/theme/colors.dart';

import '../components/cart_tile.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeFromCart(Food foodItem) {
    final foodList = context.read<FoodList>();
    foodList.removeFromCart(foodItem);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FoodList>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text('My Cart'),
          backgroundColor: primary,
          foregroundColor: Colors.grey[200],
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  const Text('Total  '),
                  Text('₹ ${context.read<FoodList>().totalAmount()}'),
                ],
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: value.cartList.length,
                itemBuilder: (context, index) => CartTile(
                  foodName: value.cartList[index].name,
                  foodPrice: value.cartList[index].price,
                  removeFromCart: () => removeFromCart(value.cartList[index]),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Pay Now',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
