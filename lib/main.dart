import 'package:bloc_train/bloc/counter.dart';
import 'package:bloc_train/bloc/theme.dart';
import 'package:bloc_train/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // final  router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterCubit(),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
      ],
      child: const App(),
    );
  }
}

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, bool>(
      bloc: context.read<ThemeCubit>(),
      builder: (context, state) {
        return MaterialApp(
          theme: state == true ? ThemeData.dark() : ThemeData.light(),
          home: const HomePage(),
          // onGenerateRoute: router.onRoute,
        );
      },
    );
  }
}
