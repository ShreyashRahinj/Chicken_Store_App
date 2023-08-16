import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vresto/pages/menu_page.dart';
import 'package:vresto/theme/colors.dart';

import '../components/custom_button.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // shop name
            Text(
              'Shop Name',
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            // icon
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('lib/images/chicken.png'),
            ),
            const SizedBox(
              height: 20,
            ),
            // title
            Text(
              'The Taste Of Maharashtra',
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 28,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // subtitle
            Text(
              'Experience the top quality food with us',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[200],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            // get started button
            CustomButton(
              text: 'Get Started',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MenuPage()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
