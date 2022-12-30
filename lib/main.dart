import 'package:bloc_train/routes/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: BlocProvider(
      //   create: (context) => CounterCubit(),
      //   child: const HomePage(),
      // ),
      onGenerateRoute: router.onRoute,
    );
  }
}
