import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'themee_state.dart';

class ThemeeCubit extends Cubit<ThemeeState> {
  ThemeeCubit() : super(ThemeeInitial());


  void showTextField(){}
}
