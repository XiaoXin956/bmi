// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `BMI`
  String get title {
    return Intl.message(
      'BMI',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Free Online BMI calculator`
  String get title_content {
    return Intl.message(
      'Free Online BMI calculator',
      name: 'title_content',
      desc: '',
      args: [],
    );
  }

  /// `The body mass index (BMI), or Quetelet index, is used to estimate a healthy body weight based on a person's height.`
  String get title_sub {
    return Intl.message(
      'The body mass index (BMI), or Quetelet index, is used to estimate a healthy body weight based on a person\'s height.',
      name: 'title_sub',
      desc: '',
      args: [],
    );
  }

  /// `Free calcuate your Body Mass Index (BMI)`
  String get free_calculation {
    return Intl.message(
      'Free calcuate your Body Mass Index (BMI)',
      name: 'free_calculation',
      desc: '',
      args: [],
    );
  }

  /// `My height:`
  String get me_height {
    return Intl.message(
      'My height:',
      name: 'me_height',
      desc: '',
      args: [],
    );
  }

  /// `My weight:`
  String get me_kg {
    return Intl.message(
      'My weight:',
      name: 'me_kg',
      desc: '',
      args: [],
    );
  }

  /// `unit`
  String get unit {
    return Intl.message(
      'unit',
      name: 'unit',
      desc: '',
      args: [],
    );
  }

  /// `cm`
  String get centimeter {
    return Intl.message(
      'cm',
      name: 'centimeter',
      desc: '',
      args: [],
    );
  }

  /// `kg`
  String get kg {
    return Intl.message(
      'kg',
      name: 'kg',
      desc: '',
      args: [],
    );
  }

  /// `Auto save my BMI history`
  String get save_bmi {
    return Intl.message(
      'Auto save my BMI history',
      name: 'save_bmi',
      desc: '',
      args: [],
    );
  }

  /// `Calculate BMI`
  String get calculate_bmi {
    return Intl.message(
      'Calculate BMI',
      name: 'calculate_bmi',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get classification {
    return Intl.message(
      'Category',
      name: 'classification',
      desc: '',
      args: [],
    );
  }

  /// `BMI range`
  String get bmi_range {
    return Intl.message(
      'BMI range',
      name: 'bmi_range',
      desc: '',
      args: [],
    );
  }

  /// `Underweight`
  String get bmi_thin {
    return Intl.message(
      'Underweight',
      name: 'bmi_thin',
      desc: '',
      args: [],
    );
  }

  /// `Normal`
  String get bmi_normal {
    return Intl.message(
      'Normal',
      name: 'bmi_normal',
      desc: '',
      args: [],
    );
  }

  /// `Overweight`
  String get bmi_overweight {
    return Intl.message(
      'Overweight',
      name: 'bmi_overweight',
      desc: '',
      args: [],
    );
  }

  /// `Obese`
  String get bmi_obesity {
    return Intl.message(
      'Obese',
      name: 'bmi_obesity',
      desc: '',
      args: [],
    );
  }

  /// `My BMI history`
  String get bmi_record {
    return Intl.message(
      'My BMI history',
      name: 'bmi_record',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get date {
    return Intl.message(
      'Date',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Height`
  String get height {
    return Intl.message(
      'Height',
      name: 'height',
      desc: '',
      args: [],
    );
  }

  /// `Weight`
  String get weight {
    return Intl.message(
      'Weight',
      name: 'weight',
      desc: '',
      args: [],
    );
  }

  /// `Remark`
  String get remark {
    return Intl.message(
      'Remark',
      name: 'remark',
      desc: '',
      args: [],
    );
  }

  /// `BMI`
  String get bmi_value {
    return Intl.message(
      'BMI',
      name: 'bmi_value',
      desc: '',
      args: [],
    );
  }

  /// `Action`
  String get op {
    return Intl.message(
      'Action',
      name: 'op',
      desc: '',
      args: [],
    );
  }

  /// `Del`
  String get del {
    return Intl.message(
      'Del',
      name: 'del',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
