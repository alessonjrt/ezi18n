import 'package:ezi18n/ezi18n.dart';
import 'package:ezi18n/src/errors/not_found_in_context.dart';
import 'package:flutter/material.dart';

String tr(BuildContext context, String key, {Map<String, String>? params}) {
  final ezi18n = EzI18n.of(context);

  if (ezi18n == null) {
    throw EzNotFoundInContext();
  }

  return ezi18n.tr(key, params: params);
}
