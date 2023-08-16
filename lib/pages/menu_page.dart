import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vresto/components/custom_button.dart';
import 'package:vresto/data/foodlist.dart';
import 'package:vresto/pages/cart_page.dart';
import 'package:vresto/theme/colors.dart';

import '../components/food_tile.dart';
import 'food_details_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  void navigateToFoodDetails(int index) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => FoodDetailsPage(
                  food: FoodList().foodList[index],
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Icon(
          Icons.menu,
          color: Colors.grey[800],
        ),
        title: Text(
          'City Name',
          style: TextStyle(
            color: Colors.grey[900],
          ),
        ),
        actions: [
          IconButton(
              onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartPage(),
                    ),
                  ),
              icon: const Icon(Icons.shopping_cart))
        ],
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // promo banner
          Container(
            decoration: BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.circular(8.0),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    // promo message
                    Text(
                      'Get 69% OFF',
                      style: GoogleFonts.dmSerifDisplay(
                          color: Colors.white, fontSize: 18),
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    // redeem button
                    CustomButton(text: 'Redeem', onTap: () {})
                  ],
                ),
                Image.asset(
                  'lib/images/promo.png',
                  height: 100,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          // search bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                constraints: const BoxConstraints(maxHeight: 50),
                hintText: 'Search here',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: primary,
                  ),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: primary,
                  ),
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          // menu list
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Food Menu',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                  fontSize: 16),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: FoodList().foodList.length,
                itemBuilder: (context, index) => FoodTile(
                  food: FoodList().foodList[index],
                  onTap: () => navigateToFoodDetails(index),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // popular food
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
            child: Text(
              'Most Popular',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                  fontSize: 16),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(16),
            ),
            margin: const EdgeInsets.only(left: 16, bottom: 16, right: 16),
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'lib/images/today.jpg',
                      height: 60,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Chicken Fry',
                          style: GoogleFonts.dmSerifDisplay(fontSize: 16),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          '₹ 69',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ],
                    ),
                  ],
                ),
                const Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 28,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
