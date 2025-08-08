import 'package:bmi/base/root_cubit.dart';
import 'package:bmi/generated/l10n.dart';
import 'package:bmi/screen/bmi/bmi_cubit.dart';
import 'package:bmi/screen/bmi/bmi_view.dart';
import 'package:bmi/screen/home_page.dart';
import 'package:bmi/screen/record/record_cubit.dart';
import 'package:bmi/utils/sp_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SPUtils.instance.init();

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  String languageCode = "zh";

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => RootCubit()),
          BlocProvider(create: (context) => BmiCubit()),
          BlocProvider(create: (context) => RecordCubit()..searchBmiData()),
        ],
        child: BlocBuilder<RootCubit, RootState>(
          builder: (context, state) {
            if(state is RootLanguageChangedState){
              print("选择的语言是：${state.languageCode}");
              languageCode = state.languageCode;
              S.load(Locale(state.languageCode));
            }
            return MaterialApp(
              navigatorKey: navigatorKey,
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: HomePage(),
              localizationsDelegates: const [
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                S.delegate,
              ],
              supportedLocales: const [
                Locale("zh"),
                Locale("en"),
              ],
              locale: Locale(languageCode),
            );
          },
        ));
  }
}
