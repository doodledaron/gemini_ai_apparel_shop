part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

//initial event that trigger the HomeLoadedState
class HomeInitialEvent extends HomeEvent {}