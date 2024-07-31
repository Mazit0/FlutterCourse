import 'package:bloc_sample/features/home/bloc/home_bloc.dart';
import 'package:bloc_sample/features/home/view/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context)
    => BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(HomeInitialState()),
      child: HomeView(),
    );

}