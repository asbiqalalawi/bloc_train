import 'package:bloc_train/bloc/counter.dart';
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
    );
  }
}
