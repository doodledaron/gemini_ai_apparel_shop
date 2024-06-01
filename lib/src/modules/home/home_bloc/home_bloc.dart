import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gemini_ai_apparel_shop/src/modules/home/model/apparel.dart';
import 'package:gemini_ai_apparel_shop/src/modules/home/repositories/apparel_repo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ApparelRepo _apparelRepo;
  HomeBloc(this._apparelRepo) : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    try {
      final apparels = await _apparelRepo.fetchApparels();
      Future.delayed(const Duration(seconds: 2));
      emit(HomeLoadedState(apparels: apparels));
    } catch (error) {
      emit(HomeErrorState(error: error.toString()));
    }
  }

//so that in the tab, it can get filtered apparrel
  List<Apparel> getApparelsByType(String type) {
    //only works when the screen''s state is loaded state
    if (state is HomeLoadedState) {
      final allApparels = (state as HomeLoadedState).apparels;
      return allApparels.where((apparel) => apparel.type == type).toList();
    }
    return [];
  }
}
