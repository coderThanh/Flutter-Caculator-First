part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object?> get props => [];
}

class ThemeChangeDark extends ThemeEvent {
  final bool isThemeDark;

  const ThemeChangeDark({required this.isThemeDark});

  @override
  List<Object?> get props => [isThemeDark];
}
