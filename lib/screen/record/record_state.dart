import 'package:bmi/bean/bmi_bean.dart';
import 'package:equatable/equatable.dart';

abstract class RecordState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RecordInitState extends RecordState {}

class RecordDataState extends RecordState {
  final List<BmiBean> bmiData;

  RecordDataState({required this.bmiData});

  @override
  List<Object?> get props => [bmiData];
}

class RecordDelState extends RecordState {
  int index;
  dynamic random;

  RecordDelState({required this.index,this.random});

  @override
  List<Object?> get props => [index,random];
}
