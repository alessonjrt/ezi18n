import 'package:ezi18n/ezi18n.dart';
import 'package:flutter/material.dart';

String tr(BuildContext context, String key, {Map<String, String>? params}) {
  return EzI18n.of(context).tr(key, params: params);
}
