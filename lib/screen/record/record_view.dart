import 'package:bmi/bean/bmi_bean.dart';
import 'package:bmi/generated/l10n.dart';
import 'package:bmi/views/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphic/graphic.dart';

import 'record_cubit.dart';
import 'record_state.dart';

class RecordView extends StatelessWidget {
  RecordCubit? recordCubit;
  List<BmiBean> bmiData = [];
  List<Map<String, dynamic>> bmiChart = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecordCubit, RecordState>(builder: (context, state) {
      recordCubit = BlocProvider.of<RecordCubit>(context);
      if (state is RecordDataState) {
        bmiData = state.bmiData ?? [];
        bmiChart = state.chartData ?? [];
      } else if (state is RecordDelState) {
        bmiData.removeAt(state.index);
        bmiChart.removeAt(state.index);
      }
      return _buildPage(context);
    });
  }

  Widget _buildPage(BuildContext context) {
    return Container(
      child: Column(
        children: [
          textWidget(text: "${S.of(context).bmi_record}", textStyle: TextStyle(fontSize: 20)),
          // 作图
          // 统计图
          if (bmiChart.isNotEmpty)
            SizedBox(
              height: 200,
              child: Chart(
                data: bmiChart,
                variables: {
                  'label': Variable(
                    accessor: (Map map) => map['label'] as String,
                  ),
                  'value': Variable(
                    accessor: (Map map) => map['value'] as num,
                  ),
                },
                axes: [
                  Defaults.horizontalAxis,
                  Defaults.verticalAxis,
                ],
                marks: [IntervalMark()],
              ),
            ),

          // 表格
          SizedBox(
            width: double.maxFinite,
            child: DataTable(
                columns: [
                  DataColumn(label: Text("${S.of(context).date}")),
                  DataColumn(label: Text("${S.of(context).height}")),
                  DataColumn(label: Text("${S.of(context).kg}")),
                  DataColumn(label: Text("${S.of(context).bmi_value}")),
                  DataColumn(label: Text("${S.of(context).remark}")),
                  DataColumn(label: Text("${S.of(context).op}")),
                ],
                rows: bmiData.asMap().entries.map((e) {
                  dynamic key = e.key;
                  BmiBean value = e.value;

                  int state = value.state ?? 0;
                  String label = "";
                  String languageCode = Localizations.localeOf(context).languageCode;
                  if (state == 0) {
                    if (languageCode == "zh") {
                      label = "偏瘦";
                    } else {
                      label = "Thin";
                    }
                  } else if (state == 1) {
                    if (languageCode == "zh") {
                      label = "正常";
                    } else {
                      label = "Normal";
                    }
                  } else if (state == 2) {
                    if (languageCode == "zh") {
                      label = "过重";
                    } else {
                      label = "Overweight";
                    }
                  } else if (state == 3) {
                    if (languageCode == "zh") {
                      label = "肥胖";
                    } else {
                      label = "Obesity";
                    }
                  } else if (state == 4) {
                    if (languageCode == "zh") {
                      label = "重度肥胖";
                    } else {
                      label = "Severe obesity";
                    }
                  }

                  Color textColor = Colors.black;
                  if (state == 0) {
                    textColor = Colors.grey;
                  } else if (state == 1) {
                    textColor = Colors.green;
                  } else if (state == 2) {
                    textColor = Colors.yellow;
                  } else if (state == 3) {
                    textColor = Colors.redAccent;
                  } else if (state == 4) {
                    textColor = Colors.red;
                  }
                  return DataRow(cells: [
                    DataCell(Text(value.date.toString())),
                    DataCell(Text(value.height.toString())),
                    DataCell(Text(value.kg.toString())),
                    DataCell(Text(value.bmiValue.toString())),
                    DataCell(Text(
                      "${label}",
                      style: TextStyle(
                        color: textColor,
                      ),
                    )),
                    DataCell(TextButton(
                      onPressed: () {
                        recordCubit?.delBmiData(index: key, key: value.id.toString());
                        // 刷新
                        recordCubit?.searchBmiData();
                      },
                      child: Text("${S.of(context).del}"),
                    )),
                  ]);
                }).toList()),
          )
        ],
      ),
    );
  }
}
