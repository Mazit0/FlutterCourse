import 'package:bloc_sample/features/home/bloc/home_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context)
    => BlocConsumer<HomeBloc, HomeState>
      (
        builder: (context, state) => _buildView(context, state),
        listener: _runningListeners);

  void _runningListeners(BuildContext context, HomeState state) {
  }

  Widget _buildView(BuildContext context, HomeState state)
    => Scaffold(
      appBar: AppBar(
        title: const Text('Home view'),
      ),
      body: _buildBodyView(context,state),
    );

  Widget _buildBodyView(BuildContext context, HomeState state)
    => switch(state) {

      HomeInitialState() => _buildInitialView(context,state),
      HomeLoadingState() => _buildLoadingView(context,state),
      HomeLoadedState() => _buildLoadedView(context,state),
    };

  Widget _buildInitialView(BuildContext context, HomeInitialState state)
    => Column(
      children: [
        const Text('Hello world bloc'),
        TextButton(
            onPressed: () => context.read<HomeBloc>().add(HomeLetsWorkEvent()),
            child: const Text('Lets work'))
      ],
    );

  Widget _buildLoadingView(BuildContext context, HomeLoadingState state)
    => const Center(
      child: Text('Loading'),
    );

  Widget _buildLoadedView(BuildContext context, HomeLoadedState state)
    => Center(
      child: Column(
        children: [
          Text(state.date.toString()),
          TextButton(
              onPressed: () => context.read<HomeBloc>().add(HomeBackEvent()),
              child: const Text('Back')),
          TextButton(
              onPressed: () => context.read<HomeBloc>().add(HomeLetsWorkEvent()),
              child: const Text('Lets work'))
        ],
      )

    );


}