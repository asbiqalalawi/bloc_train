import 'dart:developer';

import 'package:bloc_train/bloc/user_cubit.dart';
import 'package:bloc_train/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormPage extends StatelessWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Extension Method
    // 1. context.read()
    // 2. context.watch()
    // 1. context.select()

    /*read will be called once 
     watch follow the context to rebuild when changes are made
     select same as watch but specific column
     */

    var userCubit = context.read<UserCubit>();
    // var userCubitWatch = context.watch<UserCubit>();

    log('Build Scaffold');

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
          // Same #####################################################################
          const Divider(),
          Builder(
            builder: (context) {
              log('Change Name Watch');
              var watchUser = context.select<UserCubit, String>((value) => value.state.name);
              return Text('Name    : ' + watchUser);
            },
          ),
          Builder(
            builder: (context) {
              log('Change Age Watch');
              var watchUser = context.select<UserCubit, int>((value) => value.state.age);
              return Text('Age    : ' + watchUser.toString());
            },
          ),
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
