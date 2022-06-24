import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeLoadded(isThemeDark: ThemeInitial.isThemeDark)) {
    on<ThemeChangeDark>((event, emit) {
      if (state is ThemeLoadded) {
        emit(ThemeLoadded(isThemeDark: event.isThemeDark));
      }
    });
  }
}
