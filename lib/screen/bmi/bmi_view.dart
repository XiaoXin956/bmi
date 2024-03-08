import 'package:bmi/generated/l10n.dart';
import 'package:bmi/screen/bmi/bmi_cubit.dart';
import 'package:bmi/screen/bmi/bmi_cubit.dart';
import 'package:bmi/screen/record/record_cubit.dart';
import 'package:bmi/views/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmiView extends StatefulWidget {
  const BmiView({super.key});

  @override
  State<BmiView> createState() => _BmiViewState();
}

class _BmiViewState extends State<BmiView> {
  bool checkSaveData = false;
  double bmiValue = 0.0;
  BmiCubit? bmiCubit;
  List<dynamic> bmiData = [];
  String kgValue = "";
  String heightValue = "";

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      bmiCubit?.initBmiData(languageCode: Localizations.localeOf(context).languageCode,);
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BmiCubit, BmiState>(
      builder: (context, state) {
        bmiCubit = context.read<BmiCubit>();
        if (state is BmiValueState) {
          bmiValue = state.bmiValue;
          if (checkSaveData) {
            context.read<RecordCubit>().searchBmiData();
          }
        } else if (state is BmiInitDataState) {
          bmiData = state.bmiData;
        } else if (state is BmiSaveDataState) {
          checkSaveData = state.checkSave;
        }
        return buildUI();
      },
    );
  }

  Widget buildUI() {
    return Column(
      children: <Widget>[
        h(20),
        textWidget(text: S.of(context).title_content, textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        h(15),
        Text( S.of(context).title_sub),
        h(15),
        LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final Widget child;
            if (constraints.maxWidth > 1000) {
              // 横屏显示
              child = Row(
                children: [
                  Expanded(child: bmiCalculate()),
                  Expanded(child: bmiIcon()),
                ],
              );
            } else {
              // 竖屏显示
              child = Column(
                children: [
                  bmiCalculate(),
                  bmiIcon(),
                ],
              );
            }
            return child;
          },
        )
      ],
    );
  }

  Widget bmiCalculate() {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          h(15),
          textWidget(text: S.of(context).free_calculation),
          h(15),
          textWidget(text: (bmiValue > 0) ? "您当前的 BMI 值是：${bmiValue}" : ""),
          h(15),
          Row(children: [
            textWidget(text: S.of(context).me_height),
            Expanded(
                child: TextField(
                    decoration: InputDecoration(
                      hintText: "请输入身高",
                    ),
                    onChanged: (value) {
                      heightValue = value;
                    })),
            textWidget(text: "${S.of(context).unit}: ${S.of(context).centimeter}"),
          ]),
          h(15),
          Row(children: [
            textWidget(text: "${S.of(context).kg}"),
            Expanded(child: TextField(
              onChanged: (value) {
                kgValue = value;
              },
            )),
            textWidget(text: "${S.of(context).unit}: ${S.of(context).kg}"),
          ]),
          h(15),
          Row(
            children: [
              Checkbox(
                  value: checkSaveData,
                  onChanged: (value) {
                    bmiCubit?.updateSaveData(checkSave: value ?? false);
                  }),
              textWidget(text: "${S.of(context).save_bmi}"),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                bmiCubit?.calculateBmi(languageCode: Localizations.localeOf(context).languageCode,kg: kgValue, heightValue: heightValue, checkSaveData: checkSaveData);
              },
              child: textWidget(text: "${S.of(context).calculate_bmi}")),
        ],
      ),
    );
  }

  Widget bmiIcon() {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey, width: 1)),
      child: Column(
        children: [
          textWidget(text: "BMI 标准"),
          Row(
            children: [
              SizedBox(
                width: 30,
              ),
              Expanded(child: Center(child: textWidget(text: "${S.of(context).classification}"))),
              Expanded(child: textWidget(text: "${S.of(context).bmi_range}")),
            ],
          ),
          Divider(
            height: 1,
            color: Colors.white,
          ),
          Container(
            child: Column(
              children: bmiData.map((e) {
                double minValue = e["minValue"];
                double maxValue = e["maxValue"];
                String label = e["label"];
                String labelValue = e["labelValue"];
                Color bgColor = e["bgColor"];

                return Container(
                  color: bgColor,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            (bmiValue >= minValue && bmiValue <= maxValue)
                                ? SizedBox(
                                    width: 30,
                                    child: Icon(
                                      Icons.arrow_forward_outlined,
                                      color: Colors.blue,
                                    ))
                                : SizedBox(
                                    width: 30,
                                  ),
                            Expanded(child: Center(child: textWidget(text: "${label}"))),
                            Expanded(child: textWidget(text: "${labelValue}")),
                          ],
                        ),
                      ),
                      Divider(
                        height: 1,
                        color: Colors.grey,
                      )
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
