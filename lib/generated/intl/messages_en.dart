// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "bmi_normal": MessageLookupByLibrary.simpleMessage("Normal"),
        "bmi_obesity": MessageLookupByLibrary.simpleMessage("Obese"),
        "bmi_overweight": MessageLookupByLibrary.simpleMessage("Overweight"),
        "bmi_range": MessageLookupByLibrary.simpleMessage("BMI range"),
        "bmi_record": MessageLookupByLibrary.simpleMessage("My BMI history"),
        "bmi_thin": MessageLookupByLibrary.simpleMessage("Underweight"),
        "bmi_value": MessageLookupByLibrary.simpleMessage("BMI"),
        "calculate_bmi": MessageLookupByLibrary.simpleMessage("Calculate BMI"),
        "centimeter": MessageLookupByLibrary.simpleMessage("cm"),
        "classification": MessageLookupByLibrary.simpleMessage("Category"),
        "date": MessageLookupByLibrary.simpleMessage("Date"),
        "del": MessageLookupByLibrary.simpleMessage("Del"),
        "free_calculation": MessageLookupByLibrary.simpleMessage(
            "Free calcuate your Body Mass Index (BMI)"),
        "height": MessageLookupByLibrary.simpleMessage("Height"),
        "kg": MessageLookupByLibrary.simpleMessage("kg"),
        "me_height": MessageLookupByLibrary.simpleMessage("My height:"),
        "me_kg": MessageLookupByLibrary.simpleMessage("My weight:"),
        "op": MessageLookupByLibrary.simpleMessage("Action"),
        "remark": MessageLookupByLibrary.simpleMessage("Remark"),
        "save_bmi":
            MessageLookupByLibrary.simpleMessage("Auto save my BMI history"),
        "title": MessageLookupByLibrary.simpleMessage("BMI"),
        "title_content":
            MessageLookupByLibrary.simpleMessage("Free Online BMI calculator"),
        "title_sub": MessageLookupByLibrary.simpleMessage(
            "The body mass index (BMI), or Quetelet index, is used to estimate a healthy body weight based on a person\'s height."),
        "unit": MessageLookupByLibrary.simpleMessage("unit"),
        "weight": MessageLookupByLibrary.simpleMessage("Weight")
      };
}
