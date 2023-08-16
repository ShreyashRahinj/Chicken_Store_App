import 'package:flutter/material.dart';

class CartTile extends StatelessWidget {
  final String foodName;
  final String foodPrice;
  final void Function()? removeFromCart;
  const CartTile(
      {super.key,
      required this.foodName,
      required this.foodPrice,
      this.removeFromCart});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          title: Text(
            foodName,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            '₹ $foodPrice',
            style: TextStyle(color: Colors.grey[600]),
          ),
          trailing: IconButton(
              onPressed: removeFromCart, icon: const Icon(Icons.delete)),
        ),
      ),
    );
  }
}
