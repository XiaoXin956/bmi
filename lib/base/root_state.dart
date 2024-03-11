part of 'root_cubit.dart';

abstract class RootState extends Equatable {
  const RootState();
}

class RootInitial extends RootState {
  @override
  List<Object> get props => [];
}

class RootLanguageChangedState extends RootState {

  final String languageCode;


  RootLanguageChangedState({required this.languageCode});

  @override
  List<Object> get props => [languageCode];
}
