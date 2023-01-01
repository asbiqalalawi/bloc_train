import 'package:bloc_train/bloc/counter.dart';
import 'package:bloc_train/bloc/theme.dart';
import 'package:bloc_train/pages/form_page.dart';
import 'package:bloc_train/pages/second_page.dart';
import 'package:bloc_train/pages/text_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  // Stream<int> streamCount() async* {
  //   for (int i = 0; i < 10; i++) {
  //     await Future.delayed(const Duration(seconds: 1));
  //     yield i;
  //   }
  // }

  // CounterCubit counter = CounterCubit();

  @override
  Widget build(BuildContext context) {
    CounterCubit counter = BlocProvider.of<CounterCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Latihan BLOC'),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FormPage(),
              ),
            ),
            icon: const Icon(Icons.input),
          ),
          IconButton(
            onPressed: () => context.read<ThemeCubit>().changeTheme(),
            icon: const Icon(Icons.sunny),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider.value(
                value: counter,
                child: const SecondPage(),
              ),
            ),
          );

          // Navigator.pushNamed(context, '/second');
        },
        child: const Icon(Icons.arrow_forward),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Material(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () => BlocProvider.of<CounterCubit>(context).minData(),
                  child: const SizedBox(
                    height: 100,
                    width: 70,
                    child: Center(
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const TextCounter(),
              Material(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () => counter.addData(),
                  child: const SizedBox(
                    height: 100,
                    width: 70,
                    child: Center(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
