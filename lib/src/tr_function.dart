import 'package:ezi18n/ezi18n.dart';
import 'package:flutter/material.dart';

String tr(BuildContext context, String key, {Map<String, String>? params}) {
  final ezi18n = EzI18n.of(context);
  return ezi18n.tr(key, params: params);
}
