import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vresto/models/food.dart';

class FoodTile extends StatelessWidget {
  final void Function()? onTap;
  final Food food;
  const FoodTile({super.key, required this.food, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image
            Image.asset(
              food.imagePath,
              height: 120,
            ),

            // text
            Text(
              food.name,
              style: GoogleFonts.dmSerifDisplay(fontSize: 16),
            ),
            // price + rating
            SizedBox(
              width: 120,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // price
                    Text('₹ ${food.price}'),
                    // rating
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow[800],
                        ),
                        Text(
                          food.rating,
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
