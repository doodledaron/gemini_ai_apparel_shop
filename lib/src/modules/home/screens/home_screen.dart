import 'package:flutter/material.dart';
import 'package:gemini_ai_apparel_shop/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/item_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Trendify',
          style: GoogleFonts.lato(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        forceMaterialTransparency: true,
      ),

      body: GridView.builder(
        itemCount: 10,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.6,
        ),
        itemBuilder: (context, index) {
          return const ItemCard();
        },
      ),
    );
  }
}
