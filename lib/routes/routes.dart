import 'package:bloc_train/bloc/counter.dart';
import 'package:bloc_train/pages/404_page.dart';
import 'package:bloc_train/pages/home_page.dart';
import 'package:bloc_train/pages/second_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  final CounterCubit counter = CounterCubit();

  Route onRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: counter,
            child: const HomePage(),
          ),
        );
      case '/second':
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: counter,
            child: const SecondPage(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const EmptyState(),
        );
    }
  }
}
