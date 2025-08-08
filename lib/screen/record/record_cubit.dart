import 'package:bmi/bean/bmi_bean.dart';
import 'package:bmi/generated/l10n.dart';
import 'package:bmi/utils/date_tool.dart';
import 'package:bmi/utils/sp_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphic/graphic.dart';

import 'record_state.dart';

class RecordCubit extends Cubit<RecordState> {
  RecordCubit() : super(RecordInitState());


  void searchBmiData() async {
    // boxCollection ??= await SPUtils().getData(key).open("bmi_db", {"bmi_data"});
    // final bmiBox = await boxCollection?.openBox("bmi_data");
    // Map<String, dynamic>? mapData = await bmiBox?.getAllValues();
    // printBlue(mapData);
    // List<BmiBean> bmiData = [];
    // List<Map<String,dynamic>> chartData = []; // 图表数据
    // mapData?.forEach((key, value) {
    //   bmiData.add(BmiBean(id: key, bmiValue: value["bmiValue"], kg: value["kg"], height: value["height"], date: value["date"], state: value['state']));
    //   chartData.add({'label':'${value["date"]}','value':double.parse(value["bmiValue"])});
    // });
    // emit(RecordDataState(bmiData: bmiData, chartData: chartData));
  }

  void delBmiData({required int index, required String key}) async {
    // boxCollection ??= await BoxCollection.open("bmi_db", {"bmi_data"});
    // final bmiBox = await boxCollection?.openBox("bmi_data");
    // bmiBox?.delete(key);
    emit(RecordDelState(index: index, random: DateTime.now().millisecondsSinceEpoch));
  }
}
