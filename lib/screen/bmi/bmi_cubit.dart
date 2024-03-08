import 'dart:convert';

import 'package:bmi/bean/bmi_bean.dart';
import 'package:bmi/generated/l10n.dart';
import 'package:bmi/utils/date_tool.dart';
import 'package:bmi/utils/hive_utils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

part 'bmi_state.dart';

class BmiCubit extends Cubit<BmiState> {
  BoxCollection? boxCollection;

  BmiCubit() : super(BmiInitial());

  void init() async {
    boxCollection = await BoxCollection.open("bmi_db", {"bmi_data"});
  }

  void initBmiData({String? languageCode = "zh",}) {
    emit(BmiInitDataState(bmiData: [
      {"minValue": 0.00, "maxValue": 18.4, "label": "偏瘦", "labelValue": "<= 18.4", "bgColor": Colors.grey},
      {"minValue": 18.5, "maxValue": 23.9, "label": "正常", "labelValue": "18.5 ~ 23.9", "bgColor": Colors.green},
      {"minValue": 24.0, "maxValue": 27.9, "label": "过重", "labelValue": "24.0 ~ 27.9", "bgColor": Colors.yellow},
      {"minValue": 28.0, "maxValue": 32.0, "label": "肥胖", "labelValue": ">= 28.0", "bgColor": Colors.redAccent},
      {"minValue": 32.1, "maxValue": double.maxFinite, "label": "重度肥胖", "labelValue": ">= 32.4", "bgColor": Colors.red},
    ]));
  }

  // 是否保存
  void updateSaveData({required bool checkSave}) {
    if (checkSave) {
      emit(BmiSaveDataState(checkSave: checkSave));
    } else {
      emit(BmiSaveDataState(checkSave: checkSave));
    }
  }

  // 计算BMI值
  void calculateBmi({String? languageCode = "zh", required String kg, required String heightValue, required bool checkSaveData}) async {
    double heightValueTemp = int.parse(heightValue) / 100;
    double bmiValue = int.parse(kg) / (heightValueTemp * heightValueTemp);
    if (checkSaveData) {
      // save
      boxCollection ??= await BoxCollection.open("bmi_db", {"bmi_data"});
      final bmiBox = await boxCollection?.openBox("bmi_data");

      String label = "";
      if (bmiValue <= 18.4) {
        if (languageCode == "zh") {
          label = "偏瘦";
        } else {
          label = "Thin";
        }
      } else if (bmiValue >= 18.5 && bmiValue <= 23.9) {
        if (languageCode == "zh") {
          label = "正常";
        } else {
          label = "Normal";
        }
      } else if (bmiValue >= 24.0 && bmiValue <= 27.9) {
        if (languageCode == "zh") {
          label = "过重";
        } else {
          label = "Overweight";
        }
      } else if (bmiValue >= 28.0 && bmiValue <= 32.0) {
        if (languageCode == "zh") {
          label = "肥胖";
        } else {
          label = "Obesity";
        }
      } else {
        if (languageCode == "zh") {
          label = "重度肥胖";
        } else {
          label = "Severe obesity";
        }
      }
      var bmiBean = BmiBean(
        date: DateTool.getToDay(),
        label: label,
        bmiValue: "$bmiValue",
        height: heightValue,
        kg: kg,
      );
      bmiBox?.put(DateTime.now().microsecondsSinceEpoch.toString(), bmiBean.toJson());
      emit(BmiValueState(bmiValue: bmiValue, random: DateTime.now().microsecondsSinceEpoch));
    } else {
      emit(BmiValueState(bmiValue: bmiValue, random: DateTime.now().microsecondsSinceEpoch));
    }
  }
}
