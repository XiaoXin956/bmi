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
  double bmiValue = 0.0;
  BmiCubit? bmiCubit;
  List<dynamic> bmiData = [];
  String kgValue = "";
  String heightValue = "";

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      bmiCubit?.initBmiData(
        languageCode: Localizations.localeOf(context).languageCode,
      );
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
        } else if (state is BmiInitDataState) {
          bmiData = state.bmiData;
        }
        return buildUI();
      },
    );
  }

  Widget buildUI() {
    return SizedBox(
      width: 800,
      child: Column(
        children: <Widget>[
          h(20),
          textWidget(text: S.of(context).title_content, textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          h(15),
          Text(S.of(context).title_sub),
          h(15),
          bmiCalculate(),
          bmiIcon(),
        ],
      ),
    );
  }

  Widget bmiCalculate() {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white
      ),
      margin: EdgeInsets.all(5),
      child: Column(
        children: [
          textWidget(text: (bmiValue > 0) ? "${S.of(context).current_bmi_value}${bmiValue}" : ""),
          h(15),
          Row(children: [
            Expanded(flex: 1, child: textWidget(text: "${S.of(context).me_height}(cm)")),
            Expanded(
                flex: 6,
                child: TextField(
                    decoration: InputDecoration(border: OutlineInputBorder(),focusedBorder: OutlineInputBorder()),
                    onChanged: (value) {
                      heightValue = value;
                    })),
          ]),
          h(15),
          Row(children: [
            Expanded(flex: 1, child: textWidget(text: "${S.of(context).me_kg}(kg)")),
            Expanded(
                flex: 6,
                child: TextField(
                  decoration: InputDecoration(border: OutlineInputBorder(),focusedBorder: OutlineInputBorder()),
                  onChanged: (value) {
                    kgValue = value;
                  },
                )),
          ]),
          h(15),

          ElevatedButton(
              onPressed: () {
                bmiCubit?.calculateBmi(kg: kgValue, heightValue: heightValue, );
              },
              child: textWidget(text: "${S.of(context).calculate_bmi}")),
        ],
      ),
    );
  }

  Widget bmiIcon() {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey, width: 1)),
      child: Column(
        children: [
          textWidget(text: "${S.of(context).bmi_standard}"),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    width: 30,
                  ),
                ),
                Expanded(flex: 2, child: textWidget(text: "${S.of(context).classification}")),
                Expanded(flex: 2, child: textWidget(text: "${S.of(context).bmi_range}")),
              ],
            ),
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
                int state = e["state"];
                String stateValue = e["stateValue"];
                Color bgColor = e["bgColor"];
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
                return Container(
                  color: bgColor,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      width: 20,
                                      child: AnimatedSwitcher(
                                          duration: const Duration(seconds: 5),
                                          child:
                                          (bmiValue != 0 && bmiValue >= minValue && bmiValue <= maxValue)? Icon(
                                            Icons.arrow_forward_ios_sharp,
                                            color: Colors.black,
                                            size: 15,
                                          ):Icon(Icons.add,color: Colors.transparent,))),

                                  ],
                                )),
                            Expanded(flex: 2, child: textWidget(text: "${label}")),
                            Expanded(flex: 2, child: textWidget(text: "${stateValue}")),
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
