part of 'home_bloc.dart';

sealed class HomeState {

}

class HomeInitialState extends HomeState {

}

class HomeLoadingState extends HomeState {

}

class HomeLoadedState extends HomeState {
  HomeLoadedState({required this.date});

  final DateTime date;
}

