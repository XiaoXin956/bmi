import 'package:bmi/bean/bmi_bean.dart';
import 'package:equatable/equatable.dart';
import 'package:graphic/graphic.dart';

abstract class RecordState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RecordInitState extends RecordState {}

class RecordDataState extends RecordState {
  final List<Map<String,dynamic>> chartData;

  final List<BmiBean> bmiData;

  RecordDataState({required this.bmiData,required this.chartData,});

  @override
  List<Object?> get props => [bmiData,chartData,];
}

class RecordDelState extends RecordState {
  int index;
  dynamic random;

  RecordDelState({required this.index, this.random});

  @override
  List<Object?> get props => [index, random];
}
