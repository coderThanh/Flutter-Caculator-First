part of 'theme_bloc.dart';

@immutable
abstract class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object?> get props => [];
}

class ThemeInitial extends ThemeState {
  const ThemeInitial();
  @override
  List<Object?> get props => [];
}

class ThemeLoadded extends ThemeState {
  final bool isThemeDark;

  const ThemeLoadded({required this.isThemeDark});

  @override
  List<Object?> get props => [isThemeDark];
}
