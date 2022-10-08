import 'package:bloc_train/bloc/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CounterCubit counter = context.read<CounterCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, int>(
            bloc: counter,
            builder: (context, state) {
              return Text(
                '$state',
                style: const TextStyle(fontSize: 40),
              );
            }),
      ),
    );
  }
}
