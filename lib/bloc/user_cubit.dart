import 'package:bloc/bloc.dart';
import 'package:bloc_train/models/user.dart';

class UserCubit extends Cubit<User> {
  UserCubit() : super(User(name: '', age: 0));

  void changeName(String name) => emit(User(name: name, age: state.age));

  void minAge() => emit(User(name: state.name, age: state.age - 1));

  void addAge() => emit(User(name: state.name, age: state.age + 1));
}
