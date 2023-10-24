import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ValueCubit<T> extends Cubit<T> {
  ValueCubit({required T value}) : super(value);

  void change(T value) => emit(value);

  static ValueCubit<T> of<T>(BuildContext context) {
    return context.read<ValueCubit<T>>();
  }

  static ValueCubit<T> watch<T>(BuildContext context) {
    return context.watch<ValueCubit<T>>();
  }
}

extension BrowseExtension on int {
  bool get searchVisible => this != 3;
}
