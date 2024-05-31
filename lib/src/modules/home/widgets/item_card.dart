import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/apparel.dart';

class ItemCard extends StatelessWidget {
  final Apparel apparel;
  const ItemCard({
    super.key, required this.apparel,
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
          Image.network(
            apparel.url,
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
            apparel.name,
            style: GoogleFonts.lato(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            apparel.price.toString(),
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
