import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_ai_apparel_shop/src/modules/home/home_bloc/home_bloc.dart';

import '../widgets/item_card.dart';

class CasualTab extends StatelessWidget {
  const CasualTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is HomeLoadedState) {
          //This method is particularly useful when you need to access the bloc instance to perform some actions or retrieve data from it without triggering a rebuild of the widget.
          
          final casualApparels =
              context.read<HomeBloc>().getApparelsByType('casual');
          return GridView.builder(
            itemCount: casualApparels.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.55,
            ),
            itemBuilder: (context, index) {
              return ItemCard(
                apparel: casualApparels[index],
              );
            },
          );
        } else {
          return const Center(
            child: Text('Error'),
          );
        }
      },
    );
  }
}
