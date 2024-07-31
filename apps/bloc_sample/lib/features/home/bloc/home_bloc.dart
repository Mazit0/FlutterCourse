import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';
part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(super.initialState) {

    on<HomeLetsWorkEvent>(_homeLetsWorkRequested);
    on<HomeBackEvent>(_homeBackRequested);
  }


  FutureOr<void> _homeLetsWorkRequested(HomeLetsWorkEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());

    await Future.delayed(const Duration(milliseconds: 500));

    emit(HomeLoadedState(date: DateTime.now()));

  }

  FutureOr<void> _homeBackRequested(HomeBackEvent event, Emitter<HomeState> emit) {
    emit(HomeInitialState());
  }
}