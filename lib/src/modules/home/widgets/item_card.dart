import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/shirt.jpg',
            height: 180,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Container(
                height: 15,
                width: 15,
                color: const Color(0xFF847577),
              ),
              const SizedBox(
                width: 8,
              ),
              Container(
                height: 15,
                width: 15,
                color: const Color(0xFF7FA05E),
              ),
              const SizedBox(
                width: 8,
              ),
              Container(
                height: 15,
                width: 15,
                color: const Color(0xFFE5E6E4),
              ),
            ],
          ),
          Text(
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            'Neck Short Sleeve T-shirt',
            style: GoogleFonts.lato(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'RM100.99',
            style: GoogleFonts.lato(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
