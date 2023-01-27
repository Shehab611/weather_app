import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'themee_state.dart';

class ThemeeCubit extends Cubit<ThemeeState> {
  ThemeeCubit() : super(ThemeeInitial());
  bool isTextFieldShown=false;
  TextEditingController userInput = TextEditingController();

  void showTextField(){
    if(isTextFieldShown){
      isTextFieldShown=!isTextFieldShown;
      emit(ThemeeDontShowTextField());}
    else{
      isTextFieldShown=!isTextFieldShown;
      emit(ThemeeShowTextField());
    }
  }
}
