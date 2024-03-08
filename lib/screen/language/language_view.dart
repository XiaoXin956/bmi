import 'package:bmi/base/root_cubit.dart';
import 'package:bmi/base/root_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageView extends StatefulWidget {
  const LanguageView({super.key});

  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
  RootCubit? rootCubit;
  String selectLanguageCode = "zh";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RootCubit, RootState>(
      builder: (context, state) {
        rootCubit = context.read<RootCubit>();
        if (state is RootLanguageChangedState) {
          selectLanguageCode = state.languageCode;
        }
        return buildUI();
      },
    );
  }

  Widget buildUI() {
    return Row(
      children: <Widget>[
        Text("语言"),
        TextButton(
            onPressed: () {
              rootCubit?.changeLanguage("zh");
            },
            child: Text("中文", style: TextStyle(color: selectLanguageCode == "zh" ? Colors.blue : Colors.black))),
        TextButton(
            onPressed: () {
              rootCubit?.changeLanguage("en");
            },
            child: Text("English", style: TextStyle(color: selectLanguageCode == "zh" ? Colors.blue : Colors.black)))
      ],
    );
  }
}
