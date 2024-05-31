import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_ai_apparel_shop/src/modules/home/home_bloc/home_bloc.dart';

import '../widgets/item_card.dart';

class FormalTab extends StatelessWidget {
  const FormalTab({
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

          final formalApparels =
              context.read<HomeBloc>().getApparelsByType('formal');
          return GridView.builder(
            itemCount: formalApparels.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.55,
            ),
            itemBuilder: (context, index) {
              return ItemCard(
                apparel: formalApparels[index],
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
