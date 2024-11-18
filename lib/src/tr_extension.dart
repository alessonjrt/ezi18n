import 'package:ezi18n/ezi18n.dart';
import 'package:flutter/material.dart';

extension EzI18nStringExtension on String {
  String tr(BuildContext context, {Map<String, dynamic>? params}) {
    return EzI18n.of(context).tr(this, params: params);
  }
}
