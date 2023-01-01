import 'package:bloc_train/bloc/counter.dart';
import 'package:bloc_train/bloc/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextCounter extends StatelessWidget {
  const TextCounter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CounterCubit counter = BlocProvider.of<CounterCubit>(context);

    return Container(
      height: 100,
      width: 200,
      color: Colors.red,
      child: Center(
        child: MultiBlocListener(
          listeners: [
            BlocListener<CounterCubit, int>(
              listener: (context, state) => ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Lebih dari 10'),
                  duration: Duration(seconds: 1),
                ),
              ),
              listenWhen: (previous, current) => current > 10 ? true : false,
            ),
            BlocListener<ThemeCubit, bool>(
              listener: (context, state) => ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Dark Mode On'),
                  duration: Duration(seconds: 1),
                ),
              ),
              listenWhen: (previous, current) => current == true ? true : false,
            ),
          ],
          child: BlocBuilder<CounterCubit, int>(
            bloc: counter,
            builder: (context, state) {
              return Text(
                '$state',
                style: const TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
