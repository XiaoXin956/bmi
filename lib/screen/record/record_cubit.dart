import 'package:bloc/bloc.dart';
import 'package:bmi/bean/bmi_bean.dart';
import 'package:bmi/utils/date_tool.dart';
import 'package:hive/hive.dart';

import 'record_state.dart';

class RecordCubit extends Cubit<RecordState> {
  RecordCubit() : super(RecordInitState());

  BoxCollection? boxCollection;

  void searchBmiData() async {
    boxCollection ??= await BoxCollection.open("bmi_db", {"bmi_data"});
    final bmiBox = await boxCollection?.openBox("bmi_data");
    Map<String, dynamic>? mapData = await bmiBox?.getAllValues();
    printBlue(mapData);
    List<BmiBean> bmiData = [];
    mapData?.forEach((key, value) {
      bmiData.add(BmiBean(id: key, bmiValue: value["bmiValue"], kg: value["kg"], height: value["height"], date: value["date"], label: value['label']));
    });
    emit(RecordDataState(bmiData: bmiData));
  }

  void delBmiData({required int index, required String key}) async {
    boxCollection ??= await BoxCollection.open("bmi_db", {"bmi_data"});
    final bmiBox = await boxCollection?.openBox("bmi_data");
    bmiBox?.delete(key);
    emit(RecordDelState(index: index, random: DateTime.now().millisecondsSinceEpoch));
  }
}
