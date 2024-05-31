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
      HomeInitialEvent event, Emitter<HomeState> emit) {
    emit(HomeLoadingState());
    _apparelRepo.fetchApparels().then((apparels) {
      emit(HomeLoadedState(apparels: apparels));
    }).catchError((error) {
      emit(HomeErrorState());
    });
  }
}
