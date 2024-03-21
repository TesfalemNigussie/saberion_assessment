import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saberion_assessment/app/injection/injection.dart';
import 'package:saberion_assessment/app/theme/theme.dart';
import 'package:saberion_assessment/feature/home/presentation/cubit/home_cubit.dart';
import 'package:saberion_assessment/feature/home/presentation/cubit/home_state.dart';
import 'package:saberion_assessment/feature/home/presentation/view/home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      bloc: getIt<HomeCubit>(),
      builder: (context, state) {
        return Scaffold(
          body: HomeView(
            state: state,
            onSearch: getIt<HomeCubit>().search,
            onFetchMore: getIt<HomeCubit>().fetchMore,
          ),
        );
      },
      listener: (BuildContext context, HomeState state) {},
      buildWhen: (HomeState previous, HomeState current) => previous != current,
      listenWhen: (HomeState previous, HomeState current) =>
          previous != current,
    );
  }
}
