
import 'package:bmi/screen/bmi/bmi_view.dart';
import 'package:bmi/screen/language/language_view.dart';
import 'package:bmi/screen/record/record_view.dart';
import 'package:flutter/material.dart';

import '../generated/l10n.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 选择语言部分
            LanguageView(),
            BmiView(),
            RecordView(),

          ],
        ),
      ),
    );
  }
}
