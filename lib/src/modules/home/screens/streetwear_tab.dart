import 'package:flutter/material.dart';

import '../widgets/item_card.dart';


class StreetwearTab extends StatelessWidget {
  const StreetwearTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 10,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.55,
      ),
      itemBuilder: (context, index) {
        // return const ItemCard();
      },
    );
  }
}
