part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

//actionable states : if UI got actionable states, UI want to do some action
sealed class HomeActionState extends HomeState {}

//while the app hast fully loaded. example: still fetching data from the server. Show circular indicator
final class HomeLoadingState extends HomeState {}

//while there is error while fetching data
final class HomeErrorState extends HomeState {
  final String error;
  const HomeErrorState({
    required this.error,
  });

    @override
  List<Object> get props => [error];
}

final class HomeLoadedState extends HomeState {
  final List<Apparel> apparels;
  const HomeLoadedState({
    required this.apparels,
  });


  @override
  List<Object> get props => [apparels];
}
