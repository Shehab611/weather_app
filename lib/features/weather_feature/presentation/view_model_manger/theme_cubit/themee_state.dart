part of 'themee_cubit.dart';

abstract class ThemeeState extends Equatable {
  const ThemeeState();
  @override
  List<Object> get props => [];
}

class ThemeeInitial extends ThemeeState {}
class ThemeeShowTextField extends ThemeeState {}
class ThemeeDontShowTextField extends ThemeeState {}
