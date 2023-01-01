import 'dart:developer';

import 'package:bloc_train/bloc/user_cubit.dart';
import 'package:bloc_train/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormPage extends StatelessWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userCubit = context.read<UserCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Page'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          BlocSelector<UserCubit, User, String>(
            selector: (state) => state.name,
            bloc: userCubit,
            builder: (context, state) {
              log('Change Name');
              return Text('Name : ' + state);
            },
          ),
          BlocSelector<UserCubit, User, int>(
              selector: (state) => state.age,
              bloc: userCubit,
              builder: (context, state) {
                log('Change Age');
                return Text('Age    : ' + state.toString());
              }),
          TextFormField(
            onChanged: (value) => userCubit.changeName(value),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              IconButton(
                onPressed: () => userCubit.minAge(),
                icon: const Icon(Icons.remove),
              ),
              const SizedBox(
                width: 10,
              ),
              IconButton(
                onPressed: () => userCubit.addAge(),
                icon: const Icon(Icons.add),
              ),
            ],
          )
        ],
      ),
    );
  }
}
