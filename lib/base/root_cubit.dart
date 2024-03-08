import 'dart:ui';

import 'package:bmi/generated/l10n.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'root_state.dart';

class RootCubit extends Cubit<RootState> {
  RootCubit() : super(RootInitial());

  void changeLanguage(String languageCode) {

    S.load(Locale(languageCode));

    emit(RootLanguageChangedState(languageCode: languageCode));
  }

}
