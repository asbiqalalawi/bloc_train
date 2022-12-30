import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(false);

  void changeTheme() => emit(!state);

  @override
  void onChange(Change<bool> change) {
    super.onChange(change);
    debugPrint(change.toString());
  }
}
