import 'package:bmi/bean/bmi_bean.dart';
import 'package:bmi/generated/l10n.dart';
import 'package:bmi/views/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'record_cubit.dart';
import 'record_state.dart';

class RecordView extends StatelessWidget {
  RecordCubit? recordCubit;
  List<BmiBean> bmiData = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecordCubit, RecordState>(builder: (context, state) {
      recordCubit = BlocProvider.of<RecordCubit>(context);
      if (state is RecordDataState) {
        bmiData = state.bmiData;
      } else if (state is RecordDelState) {
        bmiData.removeAt(state.index);
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
          // 表格
          DataTable(
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
                return DataRow(cells: [
                  DataCell(Text(value.date.toString())),
                  DataCell(Text(value.height.toString())),
                  DataCell(Text(value.kg.toString())),
                  DataCell(Text(value.bmiValue.toString())),
                  DataCell(Text(value.label.toString())),
                  DataCell(TextButton(
                    onPressed: () {
                      recordCubit?.delBmiData(index: key, key: value.id.toString());
                    },
                    child: Text("${S.of(context).del}"),
                  )),

                ]);
              }).toList())
        ],
      ),
    );
  }
}

//
//
//
//
//
//
//
//
//
//
//
