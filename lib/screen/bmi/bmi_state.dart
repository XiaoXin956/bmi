part of 'bmi_cubit.dart';

@immutable
abstract class BmiState extends Equatable {
  @override
  List<Object?> get props => [];
}

class BmiInitial extends BmiState {}

class BmiInitDataState extends BmiState {
  List<dynamic> bmiData;
  BmiInitDataState({required this.bmiData});
  @override
  List<Object?> get props => [bmiData];
}

class BmiValueState extends BmiState {

  dynamic random;
  double bmiValue;
  BmiValueState({required this.bmiValue,this.random});
  @override
  List<Object?> get props => [bmiValue,random];
}
